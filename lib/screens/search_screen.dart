import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Arama');
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey[300],
      child: ListTile(
        trailing: IconButton(
          icon: cusIcon,
          onPressed: () {
            setState(() {
              if(this.cusIcon.icon == Icons.search){
                this.cusIcon = Icon(Icons.cancel);
                this.cusSearchBar = TextField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.go,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),
                );
              } else {
                this.cusIcon = Icon(Icons.search);
                this.cusSearchBar = Text('Arama');
              }
            });
          },
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     title: Text('Arama'),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         onPressed: () {},
    //       ),
    //     ],
    //     bottom: PreferredSize(
    //       preferredSize: Size(50, 50),
    //       child: Container(),
    //     ),
    //   ),
    // );
  }
}
