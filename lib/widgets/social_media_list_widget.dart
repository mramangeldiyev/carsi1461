import 'package:carsi1461/custom_icon_icons.dart';
import 'package:carsi1461/facebook_custom_icon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SocialMediaListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _facebookLaunchURL() async {
      // const url = 'https://www.facebook.com/Carsi1461com-397214647798908/';
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }

    _youtubeLaunchURL() async {
      // const url = 'http://carsi1461.com/#';
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }

    _twitterLaunchURL() async {
      // const url = 'http://carsi1461.com/#';
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }

    _instagramLaunchURL() async {
      // const url = 'https://www.instagram.com/carsi1461/';
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }

    return Material(
      child: Container(
        color: Colors.white,
        height: 40,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF3b5998),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    FacebookCustomIcon.facebook_logo,
                    //CustomIcon.instagram,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () {
                    _facebookLaunchURL();
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                //color: Colors.black,
                decoration: BoxDecoration(
                  color: Color(0xFFc4302b),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    CustomIcon.youtube,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () {
                    _youtubeLaunchURL();
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                //color: Colors.black,
                decoration: BoxDecoration(
                  color: Color(0xFF1DA1F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    CustomIcon.twitter,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () {
                    _twitterLaunchURL();
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                //color: Colors.black,
                decoration: BoxDecoration(
                  color: Color(0xFFd81f5e),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(
                    CustomIcon.instagram,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () {
                    _instagramLaunchURL();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
