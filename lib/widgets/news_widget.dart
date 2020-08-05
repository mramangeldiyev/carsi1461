import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<News> parseNews(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<News>((json) => News.fromJson(json)).toList();
}

Future<List<News>> fetchNews(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/news.php');

  return compute(parseNews, response.body);
}

class News {
  final String news_title;
  final String news_image;
  final String news_description;

  News({this.news_description, this.news_title, this.news_image,});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      news_title: json['news_title'] as String,
      news_image: json['news_image'] as String,
      news_description: json['news_description'] as String,
    );
  }
}

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Haberler';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: <Widget>[
            FutureBuilder<List>(
              future: fetchNews(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      for (var i in snapshot.data) newsList(i),
                    ],
                  );
                } else {
                  return Text('Yukleniyor');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Stack newsCarousell(News data) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      ClipRRect(
        //borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Image.network(
            'http://carsi1461.com/' + data.news_image,
            fit: BoxFit.cover,
          ),
      ),
      Container(
        margin: EdgeInsets.only(left: 11, right: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0x00000000),
              const Color(0x00000000),
              const Color(0x00000000),
              const Color(0xCC000000),
            ],
          ),
        ),
      ),
      Positioned(
        left: 20,
        bottom: 10,
        right: 10,
        child: Text(
          data.news_title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          maxLines: 2,
        ),
      ),
      // ListTile(
      //   title: Text(data.news_title),
      // ),
    ],
  );
}

GestureDetector newsList(News data) {
  String photo = 'http://carsi1461.com/' + data.news_image;
  print(data.news_image);
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            print('asd');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  )),
                  child: Image.network(
                      data.news_image == ""
                          ? 'http://carsi1461.com/uploads/logo.jpg'
                          : photo,
                      // width: 300,
                      height: 150,
                      fit: BoxFit.fitWidth),
                ),
              ),
              ListTile(
                title: Text(
                  data.news_title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // ListTile(
              //   title: Text(
              //     'Telefon: ' + data.telefon
              //   ),
              // ),
              // ListTile(
              //   title: Text(
              //     'Adres: ' + data.adres,
              //     maxLines: 3,
              //   ),
              // ),
              // ListTile(
              //   title: Text(
              //     'Website: ' + data.website,
              //   ),
              // )
            ],
          ),
        ),
      ),
    ),
  );
}
