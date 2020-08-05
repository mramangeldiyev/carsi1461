// import 'package:carsi1461/screens/local_notification_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'local_notification_helper.dart';

// class LocalNotificationWidget extends StatefulWidget {
//   @override
//   _LocalNotificationWidgetState createState() =>
//       _LocalNotificationWidgetState();
// }

// class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
//   final notifications = FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();

//     final settingsAndroid = AndroidInitializationSettings('app_icon');
//     final settingsIOS = IOSInitializationSettings(
//         onDidReceiveLocalNotification: (id, title, body, payload) =>
//             onSelectNotification(payload));

//     notifications.initialize(
//         InitializationSettings(settingsAndroid, settingsIOS),
//         onSelectNotification: onSelectNotification);
//   }

//   Future onSelectNotification(String payload) async => await Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => LocalNotificationScreen(payload: payload)),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView(
//         children: <Widget>[
//           Text('Basic'),
//           RaisedButton(
//             child: Text('Show notification'),
//             onPressed: () => showOngoingNotification(notifications, title: 'Title', body: 'Body'),
//           ),
//         ],
//       ),
//     );

//     Widget title(String text) => Container(
//       margin: EdgeInsets.symmetric(vertical: 4),
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.title,
//         textAlign: TextAlign.center ,
//       ),   
//     );
//   }
// }
