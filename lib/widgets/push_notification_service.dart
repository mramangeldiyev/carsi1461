import 'package:carsi1461/models/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService extends StatefulWidget {
  @override
  _PushNotificationServiceState createState() => _PushNotificationServiceState();
}

class _PushNotificationServiceState extends State<PushNotificationService> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print('onMessage: $message');
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'], body: notification['body']
          ));
        });
      },
      onLaunch: (Map<String, dynamic> message) async{
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });

        
        setState(() {
          messages.add(Message(
            title: 'OnLaunch: ${notification['title']}',
            body: 'OnLaunch: ${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async{
        print('onResume: $message');
      }
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true)
    );
  }

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
          body: Material(
                      child: Container(
        color: Colors.white,
        child: ListView(
            children: messages.map(buildMessage).toList(),
        ),
      ),
          ),
    );
  }

  Widget buildMessage(Message message) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/carsi1461logo.jpg'),
        ),
        title: Text(message.title),
        subtitle: Text(message.body),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}