import 'package:carsi1461/screens/main_page_screen.dart';
import 'package:carsi1461/screens/more_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 25);
  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Text(
      'Tab 2',
      style: optionStyle,
    ),
    MoreScreen()
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Anasayfa'),
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
