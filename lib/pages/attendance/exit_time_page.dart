import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_1/pages/attendance/attendance_worker.dart';
import 'package:module_1/pages/data/database.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class ExitTimePage extends StatefulWidget {
  const ExitTimePage({super.key});

  @override
  State<ExitTimePage> createState() => _ExitTimePageState();
}

class _ExitTimePageState extends State<ExitTimePage> {
  final _myBox = Hive.box('workers');
  final _exitBox = Hive.box('exit');
  WorkersDataBase db = WorkersDataBase();
  List _exitUsers = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_myBox.get("WORKERS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    setState(() {
      _exitUsers = _exitBox.values.toList();
    });
  }

  void _checkUser(String enteredId) {
    final matchedUser = db.toDoList.firstWhere(
      (user) => user[1].toString() == enteredId,
      orElse: () => null,
    );

    if (matchedUser != null) {
      final now = tz.TZDateTime.now(tz.getLocation('Asia/Almaty'));
      String formattedTime = DateFormat('dd-MM-yyyy HH:mm').format(now);
      final userWithTime = [matchedUser[0], matchedUser[1], formattedTime];

      _exitBox.add(userWithTime);

      setState(() {
        _exitUsers = _exitBox.values.toList();
      });
    }
  }

  void _runExitFilter(String enteredKeyword) {
    List results;
    if (enteredKeyword.isEmpty) {
      results = _exitBox.values.toList();
    } else {
      results = _exitBox.values
          .where((user) => user[1].toString().contains(enteredKeyword))
          .toList();
    }

    setState(() {
      _exitUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: _exitUsers.length,
              itemBuilder: (context, index) {
                final itemOf = _exitUsers[index];
                return AttendanceTile(
                  name: itemOf[0],
                  id: itemOf[1],
                  time: itemOf[2],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                style: BorderStyle.solid,
                width: 0.6,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (value) => _runExitFilter(value),
              decoration: InputDecoration(
                isCollapsed: true,
                hintText: 'Введите ID',
                suffix: IconButton(
                  onPressed: () {
                    _checkUser(_controller.text);
                  },
                  icon: const Icon(
                    Icons.check,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
