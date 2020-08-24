import 'package:carsi1461/models/message.dart';
import 'package:carsi1461/screens/hakkimizda_screen.dart';
import 'package:carsi1461/screens/kategori_screen.dart';
import 'package:carsi1461/screens/main_page_screen.dart';
import 'package:carsi1461/screens/more_screen.dart';
import 'package:carsi1461/screens/notifications_screen.dart';
import 'package:carsi1461/screens/rehberler_screen.dart';
import 'package:carsi1461/screens/search_screen.dart';
import 'package:carsi1461/screens/takvim_screen.dart';
import 'package:carsi1461/screens/video_screen.dart';
import 'package:carsi1461/widgets/currency_widget.dart';
import 'package:carsi1461/widgets/duyurular_widget.dart';
import 'package:carsi1461/widgets/insan_kaynaklari_widget.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:carsi1461/widgets/push_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import 'firsatlar_list_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // final List<Message> messages = [];

  // _logic(Position incomeLoc) async {
  //   var currentPosition =
  //       Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  // @override
  // void initState() {
    // super.initState();
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print('onMessage: $message');
    //     final notification = message['notification'];
    //     final double latitude = message['latitude'];
    //     final double longitude = message['longitude'];
    //     setState(() {
    //       messages.add(Message(
    //         title: notification['title'],
    //         body: notification['body'],
    //         customMessage: message['yusuf'].toString(),
    //       ));
    //       _logic(Position());
    //     });
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print('onLaunch: $message');
    //     final notification = message['notification'];
    //     setState(() {
    //       messages.add(Message(
    //         title: notification['title'],
    //         body: notification['body'],
    //         customMessage: message['yusuf'].toString(),
    //       ));
    //     });
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print('onResume: $message');
    //     print(message['yusuf']);
    //     print(message.toString());
    //     final notification = message['notification'];
    //     setState(() {
    //       messages.add(Message(
    //         title: notification['title'],
    //         body: notification['body'],
    //         customMessage: message['yusuf'].toString(),
    //       ));
    //     });
    //   },
    // );

    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));
  // }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 25);
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    KategoriScreen(),
    //RehberlerScreen(),
    //VideoScreen(),
    SearchScreen(),
    HakkimizdaScreen()
    // Text(
    //   'Index 2: School',
    //   style: optionStyle,
    // ),
    //TakvimScreen()
    //MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey _scaffoldKey = new GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.06),
        child: AppBar(
          actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            //builder: (context) => NotificationsScreen(),
                            builder: (context) => PushNotificationService(),
                          ),
                        );
                      },)],
          backgroundColor: Color(0xffd3b255),
          title: Image.asset('assets/images/carsi1461logo.jpg',
              fit: BoxFit.fitHeight, height: screenHeight * 0.06),
        ),
      ),
  //     drawer:
  //     Container(
  //   width: MediaQuery.of(context).size.width,
  //   height: MediaQuery.of(context).size.height,
  //   color: Colors.white,
  //   child: ListView(
  //     padding: EdgeInsets.zero,
  //     children: [
  //       DrawerHeader(
  //         decoration: BoxDecoration(
  //             image: DecorationImage(
  //                 image: AssetImage("assets/images/carsi1461logo.jpg"),
  //                 fit: BoxFit.cover)),
  //         child: Text("Header"),
  //       ),
  //       ListTile(
  //         title: Text("Home"),
  //         onTap: () {
  //           Navigator.of(context).pop();
  //         },
  //       )
  //     ],
  //   ),
  // ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/drawer_header_background_image.jpg'), fit: BoxFit.cover),
                color: Color(0xffd3b255),
              ),
              child: Text(
                'Çarşı 1461',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people_outline),
              title: Text('Rehberler'),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RehberlerScreen(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Haberler'),
              onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewsWidget(),
                          ),
                        );
                      },
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text('Fırsatlar'),
              onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FirsatlarListScreen(),
                    ),
                  );
                },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('Duyurular'),
              onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnnouncementWidget(),
                          ),
                        );
                      },
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text('Satılık Kiralık'),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakvimScreen(),
                  ),
                ),
              },
            ),
            ExpansionTile(title: Text('Insan Kaynaklari'), leading: Icon(Icons.people), children: [
              ListTile(
              leading: Icon(Icons.date_range, color: Colors.white,),
              title: Text('İşveren'),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InsanKaynaklariScreen(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range, color: Colors.white,),
              title: Text('İş Arayan',),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InsanKaynaklariScreen(),
                  ),
                ),
              },
            ),
            ], ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Fuar Takvimi'),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakvimScreen(),
                  ),
                ),
              },
            ),
          ],
        ),
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
            title: Text(
              'Anasayfa',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            title: Text(
              'Kategori',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(
              'Arama',
              style: TextStyle(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(
              'Hakkımızda',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        //unselectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        //backgroundColor: Colors.orange[200],
        //selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        //backgroundColor: Colors.black,
        //backgroundColor: Colors.blue,
        //backgroundColor: Color(0xffd3b255),
        backgroundColor: Colors.white,
        //backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(size: 24),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
