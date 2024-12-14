import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:map/Home/HomeScreen.dart';
import 'package:map/LoginPage/Screen.dart';
import 'package:map/Theme/AppColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {

  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  // User Stream
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    //ever(firebaseUser, _setInitialScreen);
  }

  // _setInitialScreen(User? user) {
  //     if (user != null) {
  //       Get.offAll(() => HomeScreen()); // Redirect to HomeScreen if the user is logged in
  //     } else {
  //       Get.offAll(() => LoginScreen()); // Redirect to LoginScreen if no user is logged in
  //     }
  //   }

  // Register Function
  void register(String username, String email, String password, String conpass) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);

      // After successful registration, navigate to the login page
      Get.snackbar(
        "Success", "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
      // Redirect to the login page after successful registration
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Login Function
  void login(String email, String password) async {
    try {
      // Attempt to sign in with email and password
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // Save user data to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>emails = await prefs.getStringList("email")??[];
      List<String>passwords = await prefs.getStringList("passwords")??[];

      emails.add(email);
      passwords.add(password);

      await prefs.setStringList("email", emails);
      await prefs.setStringList("passwords", passwords);
      // On successful login, navigate to HomeScreen
      Get.snackbar(
        "Success",
        "Login Successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );

      // Redirect to HomeScreen after successful login
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar(
        "Error",
        "No user found for that email and password. Please register first.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kTransparent,
        colorText: kBlack,
      );
    }
  }
  void signOut() async {
    await auth.signOut();

    // Remove user data from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userEmail');
  }
}
