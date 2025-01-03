// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD_gbs3WbbNIOBt2OrAT1S6PfvN2J8b_uo',
    appId: '1:1016724413539:web:b66758637bdc64b9eaac56',
    messagingSenderId: '1016724413539',
    projectId: 'mychatapp-d0025',
    authDomain: 'mychatapp-d0025.firebaseapp.com',
    storageBucket: 'mychatapp-d0025.appspot.com',
    measurementId: 'G-8YVC2X2EJF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgBmFzbwikxewEc7CNKJ5UAjKskeWC4cs',
    appId: '1:1016724413539:android:fca1a9e703d6fe90eaac56',
    messagingSenderId: '1016724413539',
    projectId: 'mychatapp-d0025',
    storageBucket: 'mychatapp-d0025.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClIXyOWe6TXubK-7wyrQFpvolkTtLqFsQ',
    appId: '1:1016724413539:ios:0c4ef33399ea54c8eaac56',
    messagingSenderId: '1016724413539',
    projectId: 'mychatapp-d0025',
    storageBucket: 'mychatapp-d0025.appspot.com',
    iosBundleId: 'com.example.staticchat',
  );
}
