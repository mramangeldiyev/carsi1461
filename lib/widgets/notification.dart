import 'package:carsi1461/models/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

Future<void> _handleNotification (Map<dynamic, dynamic> message, bool dialog) async {
    var data = message['data'] ?? message;
    String expectedAttribute = data['expectedAttribute'];
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages =[];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print('onMessage: $message');
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
            customMessage: message['yusuf'].toString(),

          ));
        });
      },
      onLaunch: (Map<String, dynamic> message) async{
        print('onLaunch: $message');
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
            customMessage: message['yusuf'].toString(),
            
          ));
        });
      },

      onResume: (Map<String, dynamic> message) async{
        print('onResume: $message');
        print(message['yusuf']);
        print(message.toString());
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
            customMessage: message['yusuf'].toString(),
          ));
        });
      },      
    );

    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: messages.map(buildMessage).toList(),
    );
  }

  Widget buildMessage(Message message) {
    print(message.customMessage);

    return ListTile(
      //title: Text('absd'),
    );
  }
}