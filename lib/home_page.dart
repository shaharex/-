import 'package:flutter/material.dart';

import 'pages/attendance/attendance_page.dart';
import 'pages/workers/workers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _widgetsList = [
    WorkersPage(),
    AttendancePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetsList.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 34, 61, 213),
        selectedLabelStyle: TextStyle(color: Color.fromARGB(255, 34, 61, 213)),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.diversity_2_sharp),
            label: 'Работники',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Посещаемость',
          ),
        ],
        onTap: onItemTapped,
        currentIndex: _currentIndex,
      ),
    );
  }
}
