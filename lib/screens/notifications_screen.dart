import 'package:carsi1461/screens/news_detail_screen.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Bildirimler',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
      child: ListTile(
        onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewsWidget(),
                          ),
                        );
                      },
        leading: Icon(Icons.notifications, color: Colors.red,),
        title: Row(
          children: <Widget>[
            Text('notification header'),
            Expanded(child: SizedBox()),
          ],
        ),
        subtitle: Text('20.08.2020'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    ),
    );
    
  }
}

