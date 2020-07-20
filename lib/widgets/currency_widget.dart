import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Sembol',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
          ),
          Expanded(child: SizedBox()),
          Text(
            'Satış',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
          ),
          Expanded(child: SizedBox()),
          Text(
            'Değişim',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
