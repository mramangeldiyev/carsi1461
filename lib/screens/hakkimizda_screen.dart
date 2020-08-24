import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HakkimizdaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _odemeLaunchURL() async {
      const url = 'http://carsi1461.com/odeme';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _uyelikLaunchURL() async {
      const url = 'http://carsi1461.com/uyelik';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _sssLaunchURL() async {
      const url = 'http://carsi1461.com/sik-sorulan-sorular';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    _gizlilikLaunchURL() async {
      const url = 'http://carsi1461.com/gizlilik';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            _odemeLaunchURL();
          },
                  child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Container(
                    height: 120,
                    color: Colors.red
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Ödeme',
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
        ),
                GestureDetector(
                  onTap: () {
                    _uyelikLaunchURL();
                  },
                                  child: Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.passthrough,
              children: <Widget>[
                  Container(
                    height: 120,
                    color: Colors.blue
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Üyelik',
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
                ),
                GestureDetector(
                  onTap: () {
                    _sssLaunchURL();
                  },
                                  child: Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.passthrough,
              children: <Widget>[
                  Container(
                    height: 120,
                    color: Colors.orange
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Sık Sorulan Sorular',
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
                ),
                GestureDetector(
                  onTap: () {
                    _gizlilikLaunchURL();
                  },
                                  child: Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.passthrough,
              children: <Widget>[
                  Container(
                    height: 120,
                    color: Colors.green
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Gizlilik',
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
                )
      ],
    ); 
    
  }
}