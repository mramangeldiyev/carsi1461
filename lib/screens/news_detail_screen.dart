import 'package:carsi1461/widgets/news_widget.dart';
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen(this.news);
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
                  image: NetworkImage('http://carsi1461.com/' + news.news_image),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                news.news_title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 20, right: 15),
              child: Text(
                news.news_description,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
