import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

List<InsanKaynaklari> parseInsanKaynaklari(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<InsanKaynaklari>((json) => InsanKaynaklari.fromJson(json))
      .toList();
}

Future<List<InsanKaynaklari>> fetchInsanKaynaklari(http.Client client) async {
  final response = await client.get('http://carsi1461.com/test_app/ik.php');

  return compute(parseInsanKaynaklari, response.body);
}

class InsanKaynaklari {
  final String name;
  final String telefon;
  final String adres;
  final String pozisyon;

  InsanKaynaklari({
    this.name,
    this.telefon,
    this.adres,
    this.pozisyon,
  });

  factory InsanKaynaklari.fromJson(Map<String, dynamic> json) {
    return InsanKaynaklari(
      name: json['name'] as String,
      telefon: json['telefon'] as String,
      adres: json['adres'] as String,
      pozisyon: json['pozisyon'] as String,
    );
  }
}

class InsanKaynaklariScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'İnsan Kaynakları';

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
        future: fetchInsanKaynaklari(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) =>
                    insanKaynaklariCarousel(snapshot.data[item]));
          } else {
            return Center(
              child: SpinKitPouringHourglass(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }

  GestureDetector insanKaynaklariCarousel(InsanKaynaklari data) {
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
                ListTile(
                  title: Text(
                    'İşveren: ' + data.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: 'Telefon: '),
                        TextSpan(
                          text: data.telefon,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.black, fontFamily: 'Montserrat'
                              //color: AppColors.mainColor,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Montserrat'),
                      children: <TextSpan>[
                        TextSpan(text: 'Adres: '),
                        TextSpan(
                          text: data.adres,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Montserrat'),
                      children: <TextSpan>[
                        TextSpan(text: 'Pozisyon: '),
                        TextSpan(
                          text: data.pozisyon,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
