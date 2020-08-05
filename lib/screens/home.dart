import 'package:carsi1461/models/message.dart';
import 'package:carsi1461/screens/main_page_screen.dart';
import 'package:carsi1461/screens/more_screen.dart';
import 'package:carsi1461/screens/rehberler_screen.dart';
import 'package:carsi1461/widgets/currency_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages =[];



_logic(Position incomeLoc)async{
    var currentPosition = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    



  
}


   @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print('onMessage: $message');
        final notification = message['notification'];
        final double latitude = message['latitude'];
        final double longitude = message['longitude'];
        setState(() {
          messages.add(Message(
            title: notification['title'],
            body: notification['body'],
            customMessage: message['yusuf'].toString(),

          ));
          _logic(Position(

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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 25);
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    RehberlerScreen(),
    CurrencyWidget(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.orange[200],
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/carsi1461logo.jpg', fit: BoxFit.fitHeight, height: screenHeight * 0.05,),
      ),
      body: Material(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Anasayfa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            title: Text('Rehberler'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            title: Text('Piyasa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('Daha Fazla'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[600],
        //backgroundColor: Colors.orange[200],
        //selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
