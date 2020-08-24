import 'package:carsi1461/widgets/duyurular_widget.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:flutter/material.dart';

class DuyurularDetailScreen extends StatelessWidget {
  //final News news;
  final Announcement duyuru;

  DuyurularDetailScreen(this.duyuru);
  @override
  Widget build(BuildContext context) {
    //print(news.news_description);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Haberler',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://carsi1461.com/' + duyuru.news_image),
                  fit: BoxFit.contain
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                duyuru.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 20, right: 15),
              child: Text(
                duyuru.news_description,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
