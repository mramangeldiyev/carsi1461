import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AnnouncementItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => {},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment(0.0, -0.5),
              begin: Alignment(0.0, 0.6),
              colors: <Color>[
                Colors.black,
                Colors.black12.withOpacity(0.0),
              ],
            ),
          ),
          //height: screenHeight * 0.3,
          //width: screenWidth * 0.95,
          margin: EdgeInsets.all(0.6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Card(
              child: Wrap(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.network(
                        'https://pbs.twimg.com/profile_images/635584616720633856/r3Ca8WQP.jpg',
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}