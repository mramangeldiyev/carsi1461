import 'package:carousel_pro/carousel_pro.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class NewsCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchNews(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Carousel(
              showIndicator: false,
              //boxFit: BoxFit.fill,
              overlayShadow: true,
              images: <Widget>[
                for (var i in snapshot.data) newsCarousell(i),
              ],
              autoplay: true,
              autoplayDuration: Duration(seconds: 4),
            ),
          );
        } else {
          return Text('Loading');
        }
      },
    );
  }
  GestureDetector newsCarousell(News data) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () => print("ciao"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network('http://carsi1461.com/' + data.news_image,
                    // width: 300,
                    height: 150,
                    fit: BoxFit.fitWidth),
              ),
              ListTile(
                title: Text(data.news_title),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}