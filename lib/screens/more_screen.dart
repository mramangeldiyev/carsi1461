import 'package:carsi1461/screens/firsatlar_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

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
            onTap: () => {print('1')},
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
            leading: Icon(Icons.monetization_on),
            title: Text('Ödeme'),
            onTap: () => {print('5')},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Üyelik'),
            onTap: () => {print('6')},
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Sık Sorulan Sorular'),
            onTap: () => {print('7')},
          ),
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Gizlilik'),
            onTap: () => {print('8')},
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('İletişim'),
            onTap: () => {print('9')},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: ()  {
              //print('geolocators');
               Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) => print(value));
            },
          )
        ],
      ),
    );
  }
}
getCurrentLocation() async {
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
}