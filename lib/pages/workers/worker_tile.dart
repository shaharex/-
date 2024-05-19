import 'package:flutter/material.dart';

class WorkerTile extends StatelessWidget {
  const WorkerTile({
    required this.name,
    required this.id,
    required this.job,
    required this.number,
    super.key,
  });

  final String name;
  final int id;
  final String job;
  final String number;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      leading: const SizedBox(
        width: 60,
        height: 100,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 50,
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
        job,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
