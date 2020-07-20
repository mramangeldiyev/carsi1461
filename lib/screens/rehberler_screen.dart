import 'package:carsi1461/widgets/rehberler_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Rehberler> parseRehberler(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Rehberler>((json) => Rehberler.fromJson(json)).toList();
}

Future<List<Rehberler>> fetchRehberler(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/rehber.php');

  return compute(parseRehberler, response.body);
}

class Rehberler {
  final String news_image;
  final String name;
  final String telefon;
  final String adres;
  final String website;

  Rehberler({ this.name, this.news_image, this.telefon, this.adres, this.website});

  factory Rehberler.fromJson(Map<String, dynamic> json) {
    return Rehberler(
      news_image: json['news_image'] as String,
      name: json['name'] as String,
      telefon: json['telefon'] as String,
      adres: json['adres'] as String,
      website: json['website'] as String,
    );
  }
}

class RehberlerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fırsatlar';

      //title: title,
      return Scaffold(
        body: FutureBuilder<List>(
          future: fetchRehberler(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) => rehberlerCarousel(snapshot.data[item])
              );
            } else {
              return Text('Loading');
            }
          },
          ),
      );
  }


GestureDetector rehberlerCarousel(Rehberler data) {
  String photo = 'http://carsi1461.com/' + data.news_image;
  print(data.news_image);
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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey),)
                  ),
                  child: Image.network(data.news_image == "" ? 'http://carsi1461.com/uploads/logo.jpg' : photo,
                      // width: 300,
                      height: 150,
                      fit: BoxFit.fitWidth),
                ),
              ),
              ListTile(
                title: Text(
                  data.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Telefon: ' + data.telefon
                ),
              ),
              ListTile(
                title: Text(
                  'Adres: ' + data.adres,
                  maxLines: 3,
                ),
              ),
              ListTile(
                title: Text(
                  'Website: ' + data.website,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}}