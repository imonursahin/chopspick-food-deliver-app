import 'package:chopspick/views/Panel/home/home_page.dart';
import 'package:chopspick/views/Panel/home/none.dart';
import 'package:flutter/material.dart';

class Panel extends StatefulWidget {
  const Panel({Key? key}) : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  int _currentIndex = 0;
  final List _screens = [
    HomePage(),
    NonePanel(),
    NonePanel(),
    NonePanel(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _updateIndex,
          selectedItemColor: Color(0xffCE1973),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              label: " ",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: " ",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: " ",
              icon: Icon(Icons.shopping_basket),
            ),
            BottomNavigationBarItem(label: " ", icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
