import 'package:flutter/material.dart';
import 'package:userapp/global/global.dart';

import '../authentication/auth_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Perform navigation or other operations based on the selected index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
      // Navigate to the search page
        break;
      case 1:
      // Navigate to the shop page
        break;
      case 2:
      // Navigate to the cart page
        break;
      case 3:
      // Navigate to the history page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      unselectedItemColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped, // Call _onItemTapped when an item is tapped
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.watch_later),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pending_actions),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_add),
          label: 'History',
        ),
      ],
    );
  }
}
