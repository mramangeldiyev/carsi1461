import 'package:carsi1461/screens/firsatlar_list_screen.dart';
import 'package:carsi1461/screens/rehberler_screen.dart';
import 'package:carsi1461/screens/takvim_screen.dart';
import 'package:carsi1461/widgets/duyurular_widget.dart';
import 'package:carsi1461/widgets/insan_kaynaklari_widget.dart';
import 'package:carsi1461/widgets/news_widget.dart';
import 'package:flutter/material.dart';

class KategoriScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RehberlerScreen(),
              ),
            ),
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Rehberler',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NewsWidget(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Haberler',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FirsatlarListScreen(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Fırsatlar',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AnnouncementWidget(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Duyurular',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Satılık Kiralık',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InsanKaynaklariScreen(),
              ),
            ),
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'İnsan Kaynakları',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TakvimScreen(),
              ),
            ),
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Image.asset(
                    'assets/images/carsi1461logo.jpg',
                    color: Color.fromRGBO(42, 42, 42, 0.75),
                    colorBlendMode: BlendMode.darken,
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Fuar Takvimi',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
