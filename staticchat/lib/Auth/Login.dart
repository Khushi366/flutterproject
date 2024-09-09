import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staticchat/Auth/LoginDetails.dart';
import 'package:staticchat/ThemeApp/AppColor.dart';
import 'package:staticchat/Widget/MyTextBox.dart';
import 'package:staticchat/Widget/PrimaryButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  bool validateFields() {
    if (_email.text.isEmpty || _pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return false;
    }
    return true;
  }

  Future<void> saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve existing users
    List<String>? emails = prefs.getStringList('emails') ?? [];
    List<String>? passwords = prefs.getStringList('passwords') ?? [];

    // Add new user details
    emails.add(_email.text);
    passwords.add(_pass.text);

    // Save updated lists
    await prefs.setStringList('emails', emails);
    await prefs.setStringList('passwords', passwords);
  }

  void clearFields() {
    _email.clear();
    _pass.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            customTextField(controller: _email, hintText: "Email"),
            const SizedBox(height: 20.0),
            customTextField(
              controller: _pass,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            PrimaryButton(
              btntext: 'Submit',
              onclick: () async {
                if (validateFields()) {
                  await saveUserDetails();
                  clearFields();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginDetails(),
                    ),
                  );
                }
              },
              btncolor: kBlack,
            ),
          ],
        ),
      ),
    );
  }
}
