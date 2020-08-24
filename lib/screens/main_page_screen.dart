import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsi1461/screens/duyurular_detail_screen.dart';
import 'package:carsi1461/screens/firsatlar_detail_screen.dart';
import 'package:carsi1461/screens/firsatlar_list_screen.dart';
import 'package:carsi1461/screens/news_detail_screen.dart';
import 'package:carsi1461/screens/takvim_screen.dart';
import 'package:carsi1461/widgets/duyurular_widget.dart';
import 'package:carsi1461/widgets/firsatlar_widget.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:carsi1461/widgets/rehberler_widget.dart';
import 'package:carsi1461/widgets/social_media_list_widget.dart';
import 'package:carsi1461/widgets/takvim_widget.dart';
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
          //color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 6, right: 6, top: 6),
                  child: SocialMediaListWidget()),
              Container(
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
                        margin: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Haberler»',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<List>(
                      future: fetchNews(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CarouselSlider(
                            options: CarouselOptions(
                                height: screenHeight * 0.25,
                                viewportFraction: 1.0,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 4)),
                            items: <Widget>[
                              for (var i in snapshot.data)
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewsDetailScreen(i)));
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.95,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            child: Image.network(
                                              'http://carsi1461.com/' +
                                                  i.news_image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: screenWidth * 0.95,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                            i.news_title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    )),
                            ],
                          );
                        } else {
                          return Center(
                            child: SpinKitPouringHourglass(
                              color: Colors.black,
                            ),
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
                        margin: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //»»
                          'Duyurular»',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DuyurularDetailScreen(a)));
                                    },
                                    child: announcementArea(a),
                                  )
                              ],
                            ),
                          );
                        } else {
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
                height: screenHeight * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FirsatlarListScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 11.0, bottom: 0.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Fırsatlar»',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              FutureBuilder<List>(
                future: fetchFirsatlar(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.only(left: 7),
                      margin: EdgeInsets.symmetric(vertical: 6),
                      height: screenHeight * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for (var d in snapshot.data)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FirsatlarDetailScreen(d)));
                              },
                              child: firsatlarDemoArea(d),
                            )
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: SpinKitPouringHourglass(
                        color: Colors.black,
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TakvimScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 11.0, bottom: 0.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Fuar Takvimi»',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              FutureBuilder<List>(
                future: fetchTakvim(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.only(left: 7),
                      margin: EdgeInsets.symmetric(vertical: 6),
                      height: screenHeight * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          for (var f in snapshot.data)
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FirsatlarDetailScreen(f)));
                                },
                                child: Container(
                                  width: screenWidth * 0.8,
                                  //width: 150,
                                  child: GestureDetector(
                                    child: Card(
                                      elevation: 0,
                                      child: Wrap(
                                        children: <Widget>[
                                          Container(
                                            width: screenWidth * 0.8,
                                            height: screenHeight * 0.15,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8))),
                                            child: Image.network(
                                              'http://carsi1461.com/' +
                                                  f.news_image,
                                              fit: BoxFit.contain,
                                              //height: screenHeight * 0.15,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              f.name,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                //child: takvimDemoArea(f),
                                )
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: SpinKitPouringHourglass(
                        color: Colors.black,
                      ),
                    );
                  }
                },
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
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0),
                        spreadRadius: 0,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://carsi1461.com/' + data.news_image,
                      fit: BoxFit.contain,
                      height: 80,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    data.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(
              height: 1,
              color: Colors.grey[300],
              indent: 11,
              endIndent: 11,
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

  Container firsatlarDemoArea(Firsatlar data) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
      // ),
      width: 150,
      child: GestureDetector(
        child: Card(
          elevation: 0,
          child: Wrap(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                              child: Image.network(
                  'http://carsi1461.com/' + data.news_image,
                  fit: BoxFit.contain,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    data.name,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Container takvimDemoArea(Takvim data) {
  //   return Container(
  //     width: 150,
  //     child: GestureDetector(
  //       child: Card(
  //         child: Wrap(
  //           children: <Widget>[
  //             Image.network(
  //               'http://carsi1461.com/' + data.news_image,
  //               fit: BoxFit.contain,

  //             ),
  //             Container(
  //               padding: EdgeInsets.all(5),
  //               child: Text(
  //                 data.name,
  //                 style: TextStyle(fontSize: 12),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
