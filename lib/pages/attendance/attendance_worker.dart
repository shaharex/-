import 'package:flutter/material.dart';

class AttendanceTile extends StatelessWidget {
  const AttendanceTile({
    required this.name,
    required this.id,
    required this.time,
    super.key,
  });

  final String name;
  final int id;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        leading: const SizedBox(
          width: 50,
          height: 100,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 60,
          ),
        ),
        tileColor: Colors.blue[900],
        title: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Text(
          'id: $id',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: Text(
          '${time}',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
