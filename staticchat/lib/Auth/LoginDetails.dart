import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDetails extends StatefulWidget {
  const LoginDetails({Key? key}) : super(key: key);

  @override
  _LoginDetailsState createState() => _LoginDetailsState();
}

class _LoginDetailsState extends State<LoginDetails> {
  List<String>? emails = [];
  List<String>? passwords = [];

  // Retrieve user details from SharedPreferences
  Future<void> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emails = prefs.getStringList('emails') ?? [];
      passwords = prefs.getStringList('passwords') ?? [];
    });
  }

  // Delete user details from SharedPreferences
  Future<void> deleteUser(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emails!.removeAt(index);
    passwords!.removeAt(index);
    await prefs.setStringList('emails', emails!);
    await prefs.setStringList('passwords', passwords!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserDetails(); // Fetch user details when the screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: emails?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ${index + 1}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Email: ${emails![index]}', style: const TextStyle(fontSize: 16)),
                        Text('Password: ${passwords![index]}', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 10.0),
                        const Divider(),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      deleteUser(index);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
