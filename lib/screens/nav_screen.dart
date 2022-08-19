import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_app/screens/screens.dart';

class NavScreen extends StatefulWidget {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(
      body: Center(
        child: Text(
          'Pizza Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 50,
          ),
        ),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 50,
          ),
        ),
      ),
    ),
  ];

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._screens[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        onTap: (value) {
          setState(
            () {
              _currentTab = value;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/101145194?v=4',
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
