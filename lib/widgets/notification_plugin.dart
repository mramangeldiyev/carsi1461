import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPlugin extends StatefulWidget {
  @override
  _NotificationPluginState createState() => _NotificationPluginState();
}

class _NotificationPluginState extends State<NotificationPlugin> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('app_icon');
    var ios = IOSInitializationSettings();
    var initSettings = InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload){
    debugPrint('print payload : $payload');
    showDialog(context: context, builder: (_) => AlertDialog(
      title: Text('notification title'),
      content: Text('$payload'),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: showNotification, child: Text('Click this button'),
        ),
      ),
    );
  }

  showNotification() async{
    var android = AndroidNotificationDetails('channelId', 'channelName', 'channelDescription',
      priority: Priority.High, importance: Importance.Max);
      var iOS = IOSNotificationDetails();

      var platform = NotificationDetails(android, iOS);
      await flutterLocalNotificationsPlugin.show(0, 'Nury', 'Anatolia', platform, payload: 'This is my fucking name');
  }
}