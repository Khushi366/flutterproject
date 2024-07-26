import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
   Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification",style: TextStyle(fontSize:16.0,color: Colors.white),),
        backgroundColor: Color(0xFF2B3595),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: ElevatedButton(
                onPressed: () async{

                  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

                  if(isAllowed)
                    {
                      await AwesomeNotifications().createNotification(
                          content: NotificationContent(
                              id: 101,
                              channelKey: 'alerts',
                              title: "Hello from my app!",
                              body: "I am awesome notification"
                          )
                      );
                    }
                  else
                    {
                      await showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              title: Text('Get Notified!',
                                  style: Theme.of(context).textTheme.titleLarge),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          'assets/images/animated-bell.gif',
                                          height: MediaQuery.of(context).size.height * 0.3,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                      'Allow Awesome Notifications to send you beautiful notifications!'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text(
                                      'Deny',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () async {
                                      Navigator.of(ctx).pop();
                                      await AwesomeNotifications().requestPermissionToSendNotifications();

                                    },
                                    child: Text(
                                      'Allow',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(color: Colors.deepPurple),
                                    )),
                              ],
                            );
                          });

                    }

                  }, child: Text("Normal")),
          ),

          Center(
            child: ElevatedButton(
                onPressed: () async{
                  await AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 101,
                          channelKey: 'alerts',
                          title: "Hello from my app!",
                          body: "I am awesome notification",
                          bigPicture: 'asset://assets/img/notification.png',
                          notificationLayout: NotificationLayout.BigPicture,

                      )
                  );
                }, child: Text("Assets Notification")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async{
                  await AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 101,
                          channelKey: 'alerts',
                          title: "Hello from my app!",
                          body: "I am awesome notification",
                          largeIcon:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIA2_8XebabkIMt6WqSE15BEOJ-oX1ehZexQ&s",
                      )
                  );
                }, child: Text("Network Notification")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async{
                  await AwesomeNotifications().createNotification(
                      content: NotificationContent(
                          id: 101,
                          channelKey: 'alerts',
                          title: "Hello from my app!",
                          body: "I am awesome notification",
                      ),
                    actionButtons: [
                      NotificationActionButton(
                        key: 'OPEN',
                        label: 'Replay',
                        actionType: ActionType.Default,
                      ),
                      NotificationActionButton(
                        key: 'CANCEL',
                        label: 'Cancel',
                        actionType: ActionType.Default,
                      ),
                    ],
                  );

                  }, child: Text("Button Notification")),
          )
        ],
      ),
    );
  }
}




// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
//
// class NotificationPage extends StatefulWidget {
//   const NotificationPage({super.key});
//
//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }
//
// class _NotificationPageState extends State<NotificationPage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Notification",
//           style: TextStyle(fontSize: 16.0, color: Colors.white),
//         ),
//         backgroundColor: Color(0xFF2B3595),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 await AwesomeNotifications().createNotification(
//                   content: NotificationContent(
//                     id: 101,
//                     channelKey: 'alerts',
//                     title: "Hello from my app!",
//                     body: "I am an awesome notification",
//                     bigPicture: 'assets//img/your_asset_image.png', // Asset image
//                     largeIcon: 'https://via.placeholder.com/48', // Network image
//                     notificationLayout: NotificationLayout.BigPicture,
//                   ),
//                   actionButtons: [
//                     NotificationActionButton(
//                       key: 'OPEN',
//                       label: 'Assets',
//                       actionType: ActionType.Default,
//                     ),
//                     NotificationActionButton(
//                       key: 'DISMISS',
//                       label: 'Network',
//                       actionType: ActionType.DismissAction,
//                     ),
//                   ],
//                 );
//               },
//               child: Text("Submit"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
