import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'enter_time_page.dart';
import 'exit_time_page.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          labelColor: Color.fromARGB(255, 0, 6, 126),
          indicatorColor: Color.fromARGB(255, 0, 6, 126),
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                'Вход',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Выход',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          EnterTimePage(),
          ExitTimePage(),
        ],
        controller: _tabController,
      ),
    );
  }
}
