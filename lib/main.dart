import 'package:carsi1461/screens/firsatlar_list_screen.dart';
import 'package:carsi1461/screens/home.dart';
import 'package:carsi1461/widgets/duyurular_widget.dart';
import 'package:carsi1461/widgets/firsatlar_widget.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:carsi1461/widgets/social_media_list_widget.dart';
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
      //home: NewsWidget(),
      home: HomeScreen(),
      //home: AnnouncementWidget(),
      //home: FirsatlarWidget(),
      //home: FirsatlarScreen(),
      //home: SocialMediaListWidget(),
    );
  }
}