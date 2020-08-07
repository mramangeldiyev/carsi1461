import 'package:carsi1461/widgets/firsatlar_widget.dart';
import 'package:flutter/material.dart';

class FirsatlarWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container firsatlarAreaa(Firsatlar data) {
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
}