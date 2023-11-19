import 'package:flutter/material.dart';
import 'package:training_memo/screen/calendar_screen.dart';
import 'package:training_memo/screen/parts_screen.dart';
// 他の画面のインポート
// import 'package:training_memo/screen/favorite_screen.dart';
// import 'package:training_memo/screen/calendar_screen.dart';
// import 'package:training_memo/screen/setting_screen.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PartsScreen(), // この部分を実際の PartsScreen に置き換えてください
    Text('お気に入り画面'),  // 実際の FavoriteScreen に置き換えてください
    CalendarScreen(),  // 実際の CalendarScreen に置き換えてください
    Text('設定画面'),      // 実際の SettingScreen に置き換えてください
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey, // ナビゲーションバーの背景色
        selectedItemColor: Colors.red, // 選択されたアイテムの色
        unselectedItemColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: '部位',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'カレンダー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
