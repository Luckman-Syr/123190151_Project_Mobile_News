import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pakbagus/models/news_model.dart';
import 'package:project_pakbagus/screens/detailsScreen/detilsPage.dart';
import 'package:project_pakbagus/screens/homeScreen/components/brand.dart';
import 'package:project_pakbagus/screens/homeScreen/components/country.dart';
import 'package:project_pakbagus/screens/homeScreen/components/news.dart';
import 'package:project_pakbagus/screens/homeScreen/components/popular.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  bool isLogin;
  String username;
  HomePage({
    Key? key,
    required this.isLogin,
    required this.username,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            News(
                username: widget.username,),
            Popular(
                username: widget.username,),
            Country(
                username: widget.username,)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(40), boxShadow: [
          BoxShadow(
            color: Color.fromARGB(36, 0, 0, 0),
            spreadRadius: 0.5,
            blurRadius: 20,
            offset: Offset(0, 0), // changes position of shadow
          )
        ]),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grade),
              label: 'Popular',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Filter',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
