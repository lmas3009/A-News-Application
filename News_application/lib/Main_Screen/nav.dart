import 'package:News_application/Main_Screen/Menu.dart';
import 'package:News_application/Main_Screen/home.dart';
import 'package:News_application/Main_Screen/wheather.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



class Navbar extends StatefulWidget {
  Navbar({Key key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Homepage(),
            Wheather(), 
            Menu(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Wheather'),
            icon: Icon(Icons.apps)
          ),
          BottomNavyBarItem(
            title: Text('Menu'),
            icon: Icon(Icons.menu)
          ),
        ],
      ),
    );
  }
}