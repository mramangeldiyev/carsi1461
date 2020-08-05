import 'package:flutter/material.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationScreenState createState() =>
      _LocalNotificationScreenState();
}

class _LocalNotificationScreenState extends State<LocalNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification app bar title'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: null,
          child: null,
        ),
      ),
    );
  }
}
