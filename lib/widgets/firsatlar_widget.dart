import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Firsatlar> parseFirsatlar(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Firsatlar>((json) => Firsatlar.fromJson(json)).toList();
}

Future<List<Firsatlar>> fetchFirsatlar(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/firsatlar.php');

  return compute(parseFirsatlar, response.body);
}

class Firsatlar {
  final String name;
  final String news_image;

  Firsatlar({this.name, this.news_image});

  factory Firsatlar.fromJson(Map<String, dynamic> json) {
    return Firsatlar(
      name: json['name'] as String,
      news_image: json['news_image'] as String,
    );
  }
}

class FirsatlarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fırsatlar';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black
            ),
          ),
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ),
        body: ListView(
          children: <Widget>[
            FutureBuilder<List>(
              future: fetchFirsatlar(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      for (var i in snapshot.data) firsatlarCarousel(i),
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

GestureDetector firsatlarCarousel(Firsatlar data) {
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
                title: Text(data.name),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}