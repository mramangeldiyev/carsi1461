import 'package:carsi1461/widgets/takvim_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class TakvimScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {;

      //title: title,
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Fuar Takvimi',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
        backgroundColor: Colors.grey[300],
        body: FutureBuilder<List>(
          future: fetchTakvim(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) => takvimCarousel(snapshot.data[item])
              );
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
                      fit: BoxFit.contain),
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
                  'Organizatör: ' + data.organizator
                ),
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
}}