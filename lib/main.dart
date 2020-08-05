import 'package:carsi1461/draft.dart';
import 'package:carsi1461/screens/home.dart';
import 'package:carsi1461/screens/news_detail_screen.dart';
import 'package:carsi1461/widgets/notification.dart';
import 'package:carsi1461/widgets/notification_plugin.dart';
import 'package:carsi1461/widgets/one_signal_notification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.grey,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      //home: HomeScreen(),
      //home: NewsDetailScreen(),
      home: NotificationPlugin(),
      //home: OneSignalNotification(),
    );
  }
}