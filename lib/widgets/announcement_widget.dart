import 'package:carsi1461/widgets/announcement_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AnnouncementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.016,
          right: screenWidth * 0.016,
          top: screenHeight * 0.008,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.01),
              child: Row(
                children: <Widget>[
                  Text(
                    'Duyurular',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.3,
              width: screenWidth * 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return AnnouncementItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}