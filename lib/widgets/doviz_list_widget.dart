import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DovizListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(fit: FlexFit.tight, flex: 1, child: Text('data', textAlign: TextAlign.center, )),
            Flexible(fit: FlexFit.tight, flex: 1, child: Text('data', textAlign: TextAlign.center,)),
            Flexible(fit: FlexFit.tight, flex: 1, child: Text('data', textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}