import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_1/pages/attendance/attendance_worker.dart';
import 'package:module_1/pages/data/database.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class EnterTimePage extends StatefulWidget {
  const EnterTimePage({super.key});

  @override
  State<EnterTimePage> createState() => _EnterTimePageState();
}

class _EnterTimePageState extends State<EnterTimePage> {
  final _myBox = Hive.box('workers');
  final _enterBox = Hive.box('enter');
  WorkersDataBase db = WorkersDataBase();
  List _enterUsers = [];
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
      _enterUsers = _enterBox.values.toList();
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

      _enterBox.add(userWithTime);

      setState(() {
        _enterUsers = _enterBox.values.toList();
      });
    }
  }

  void _runEnterFilter(String enteredKeyword) {
    List results;
    if (enteredKeyword.isEmpty) {
      results = _enterBox.values.toList();
    } else {
      results = _enterBox.values
          .where((user) => user[1].toString().contains(enteredKeyword))
          .toList();
    }

    setState(() {
      _enterUsers = results;
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
              itemCount: _enterUsers.length,
              itemBuilder: (context, index) {
                final itemOf = _enterUsers[index];
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
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 0.6,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (value) => _runEnterFilter(value),
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
