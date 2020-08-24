import 'package:carsi1461/screens/firsatlar_list_screen.dart';
import 'package:carsi1461/screens/insan_kaynaklari_screen.dart';
import 'package:carsi1461/screens/takvim_screen.dart';
import 'package:carsi1461/widgets/insan_kaynaklari_widget.dart';
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

class MoreItems extends StatefulWidget {
  @override
  _MoreItemsState createState() => _MoreItemsState();
}

class _MoreItemsState extends State<MoreItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.people),
            title: Text('İnsan Kaynakları'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InsanKaynaklariScreen(),
                ),
              ),
            },
          ),
          ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Fuar Takvimi'),
              onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TakvimScreen(),
                      ),
                    ),
                  }),
        ],
      ),
    );
  }
}
