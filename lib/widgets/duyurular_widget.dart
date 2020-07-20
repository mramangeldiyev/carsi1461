import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Announcement> parseAnnouncement(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Announcement>((json) => Announcement.fromJson(json)).toList();
}

Future<List<Announcement>> fetchAnnouncement(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/duyurular.php');

  return compute(parseAnnouncement, response.body);
}

class Announcement {
  final String name;
  final String news_image;

  Announcement({this.name, this.news_image});

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      name: json['name'] as String,
      news_image: json['news_image'] as String,
    );
  }
}

class AnnouncementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Fırsatlar',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ),
      body: FutureBuilder<List>(
        future: fetchAnnouncement(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) =>
                    announcementCarousel(snapshot.data[item]));
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }

  GestureDetector announcementCarousel(Announcement data) {
    print(data.news_image);
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.network(
                'http://carsi1461.com/' + data.news_image,
                color: Color.fromRGBO(42, 42, 42, 0.75),
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
                height: 120,
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Text(
                  data.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}