// import 'package:flutter/material.dart';
// import 'package:permissionapp/MyHomePage.dart';
// import 'package:permissionapp/SplashScreen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   var isDarkMode = false;
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       //home: const MyHomePage(),
//       home: const SplashScreen(),
//     );
//   }
// }


//import 'package:admob_project/HomeScreen.dart';
// import 'package:admob_project/ThemeCustomizationScreen.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData(
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(
//               fontSize: 20.0,
//               color: Colors.black
//           ),
//           bodySmall: TextStyle(
//               fontSize: 18.0,
//               color: Colors.grey
//           ),
//         ),
//       ),
//       theme: ThemeData(
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(
//             fontSize: 20.0,
//             color: Colors.black
//           ),
//           bodySmall: TextStyle(
//               fontSize: 18.0,
//             color: Colors.grey
//           ),
//         ),
//       ),
//       home:ThemeCustomizationScreen(),
//     );
//   }
// }



// main.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'ThemeNotifier.dart';
// import 'MyHomePage.dart';
// import 'SplashScreen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   ThemeNotifier themeNotifier = await ThemeNotifier.create();
//   runApp(MyApp(themeNotifier: themeNotifier));
// }
//
// class MyApp extends StatelessWidget {
//   final ThemeNotifier themeNotifier;
//
//   const MyApp({Key? key, required this.themeNotifier}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ThemeNotifier>.value(
//       value: themeNotifier,
//       child: Consumer<ThemeNotifier>(
//         builder: (context, themeNotifier, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             theme: themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
//             home: const SplashScreen(),
//           );
//         },
//       ),
//     );
//   }
// }

// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeNotifier.dart';
import 'MyHomePage.dart';
import 'SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeNotifier themeNotifier = await ThemeNotifier.create();
  runApp(MyApp(themeNotifier: themeNotifier));
}

class MyApp extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const MyApp({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>.value(
      value: themeNotifier,
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.teal,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button background color for light mode
                  foregroundColor: Colors.white, // Button text color
                ),
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button background color for dark mode
                  foregroundColor: Colors.white, // Button text color
                ),
              ),
            ),
            themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),
          );
        },
      ),

    );
  }
}
