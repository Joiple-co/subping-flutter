import 'package:flutter/material.dart';
import 'package:subping/ui/main_tabs/home/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainTabs extends StatefulWidget {
  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  int _selectedIndex = 0;
  List<Widget> _pages = [Home(), null, null, null];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '섭핑'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: '구독관리'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: '마이페이지'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
