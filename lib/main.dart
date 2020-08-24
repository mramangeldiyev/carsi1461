import 'package:carsi1461/draft.dart';
import 'package:carsi1461/screens/home.dart';
import 'package:carsi1461/screens/news_detail_screen.dart';
import 'package:carsi1461/widgets/notification.dart';
import 'package:carsi1461/widgets/notification_plugin.dart';
import 'package:carsi1461/widgets/one_signal_notification.dart';
import 'package:carsi1461/widgets/push_notification_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    //DevicePreview(builder: )
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

// FirebaseMessaging firebaseMessaging = FirebaseMessaging();

// Future<void> init() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await firebaseMessaging.requestNotificationPermissions();
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: HomeScreen(),
      // home: PushNotificationService(),
    );
  }
}
