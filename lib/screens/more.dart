import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoreItems(),
    );
  }
}

class MoreItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Satılık & Kiralık'),
            onTap: () => {
              print('1')
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('İnsan Kaynakları'),
            onTap: () => {print('2')},
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Fuar Takvimi'),
            onTap: () => {print('3')},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Fırsatlar'),
            onTap: () => {print('4')},
          ),
        ],
      ),
    );
  }
}