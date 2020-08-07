import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carsi1461/screens/duyurular_detail_screen.dart';
import 'package:carsi1461/screens/firsatlar_detail_screen.dart';
import 'package:carsi1461/screens/firsatlar_list_screen.dart';
import 'package:carsi1461/screens/news_detail_screen.dart';
import 'package:carsi1461/widgets/duyurular_widget.dart';
import 'package:carsi1461/widgets/firsatlar_widget.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:carsi1461/widgets/rehberler_widget.dart';
import 'package:carsi1461/widgets/social_media_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SafeArea(
        child: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 6, right: 6, top: 6),
                  child: SocialMediaListWidget()),
              Container(
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewsWidget(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Haberler',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<List>(
                      future: fetchNews(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: screenHeight * 0.25,
                            child: Carousel(
                              showIndicator: false,
                              boxFit: BoxFit.cover,
                              overlayShadow: true,
                              images: <Widget>[
                                for (var i in snapshot.data)
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(i)));
                                    },
                                    child: newsCarousell(i),
                                  ),
                              ],
                              autoplay: true,
                              autoplayDuration: Duration(seconds: 4),
                            ),
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
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnnouncementWidget(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Duyurular',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<List>(
                      future: fetchAnnouncement(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            margin: EdgeInsets.only(left: 11, right: 11),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                for (var a in snapshot.data)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DuyurularDetailScreen(a)));
                                  },
                                  child: announcementArea(a),
                                )
                              ],
                            ),
                          );
                        } else {
                          //return Text('Loading');
                          return Center(
                            child: SpinKitPouringHourglass(
                              color: Colors.black,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                ),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FirsatlarListScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 11.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Fırsatlar',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<List>(
                      future: fetchFirsatlar(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            margin: EdgeInsets.only(left: 11, right: 11),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                for (var c in snapshot.data)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirsatlarDetailScreen(c)));
                                  },
                                  child: firsatlarArea(c),
                                )
                                
                              ],
                            ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container announcementArea(Announcement data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'http://carsi1461.com/' + data.news_image,
                  fit: BoxFit.cover,
                  height: 80,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(3),
              child: Text(
                data.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container rehberlerArea(Rehberler data) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Image.network('http://carsi1461.com/' + data.news_image),
      width: 70,
    );
  }

  Container firsatlarArea(Firsatlar data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'http://carsi1461.com/' + data.news_image,
                  fit: BoxFit.cover,
                  height: 80,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(3),
              child: Text(
                data.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
