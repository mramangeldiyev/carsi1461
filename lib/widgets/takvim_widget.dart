import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List<Takvim> parseTakvim(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Takvim>((json) => Takvim.fromJson(json)).toList();
}

Future<List<Takvim>> fetchTakvim(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/takvim.php');

  return compute(parseTakvim, response.body);
}

class Takvim {
  final String name;
  final String news_image;
  final String organizator;
  final String yer;

  Takvim({this.name, this.news_image, this.organizator, this.yer});

  factory Takvim.fromJson(Map<String, dynamic> json) {
    return Takvim(
      name: json['name'] as String,
      news_image: json['news_image'] as String,
      organizator: json['organizator'] as String,
      yer: json['yer'] as String,
    );
  }
}

class TakvimScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fuar Takvimleri';

    //title: title,
    return Scaffold(
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
      backgroundColor: Colors.grey[300],
      body: FutureBuilder<List>(
        future: fetchTakvim(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) =>
                    takvimCarousel(snapshot.data[item]));
          } else {
            //return Text('Loading');
            return Center(
              child: SpinKitPouringHourglass(
                color: Colors.black,
              ),
              // child: CircularProgressIndicator(
              //   backgroundColor: Colors.black,
              // ),
            );
          }
        },
      ),
    );
  }

  GestureDetector takvimCarousel(Takvim data) {
    String photo = 'http://carsi1461.com/' + data.news_image;
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
                  title: Text('Organizatör: ' + data.organizator),
                ),
                ListTile(
                  title: Text(
                    'Adres: ' + data.yer,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
