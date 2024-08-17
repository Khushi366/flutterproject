import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:chatapp/GoogleMapExample.dart';
import 'package:chatapp/SplashScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Notification.dart';
import 'firebase_options.dart';
import 'LoginPage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'alerts',
            channelName: 'Alerts',
            channelDescription: 'Notification tests as alerts',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
            defaultColor: Colors.deepPurple,
            ledColor: Colors.deepPurple),

      ],
      debug: true
  );

  // Set up the global notification action listener
  AwesomeNotifications().setListeners(
    onActionReceivedMethod: (receivedAction)async{
      log(receivedAction.buttonKeyPressed.toString());
      if (receivedAction.buttonKeyPressed == 'OPEN')
      {
        log('Replay');
      } else if (receivedAction.buttonKeyPressed == 'CANCEL') {
        log('Cancel');
      }
    },
  );

  await FirebaseMessaging.instance.getToken().then((token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firebasetoken", token.toString());
    log("Token stored");
  });

  FirebaseMessaging.onMessage.listen(showFlutterNotification);

  runApp(const MyApp());
}


//Firebase Notification Background Excess
void showFlutterNotification(RemoteMessage message) async{
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null ) {
   var title = notification.title.toString();
   var body = notification.title.toString();
   await AwesomeNotifications().createNotification(
       content: NotificationContent(
           id: 101,
           channelKey: 'alerts',
           title:title,
           body: body
       )
   );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    // home: GoogleMapExample(),
     // home: LoginPage(),
       //home: NotificationPage(),
       home: SplashScreen(),
    );
  }
}



