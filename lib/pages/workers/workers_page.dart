import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_1/pages/data/database.dart';
import 'package:module_1/pages/workers/new_worker_page.dart';

import 'worker_tile.dart';

class WorkersPage extends StatefulWidget {
  const WorkersPage({super.key});

  @override
  State<WorkersPage> createState() => _WorkersPageState();
}

class _WorkersPageState extends State<WorkersPage> {
  // controllers which will be saved
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final _myBox = Hive.box('workers');
  WorkersDataBase db = WorkersDataBase();

  List _foundUsers = [];

  @override
  void initState() {
    super.initState();
    // if it is the first time of creating database
    if (_myBox.get("WORKERS") == null) {
      db.createInitialData();
    } else {
      // there is already data
      db.loadData();
    }
    setState(() {
      _foundUsers = db.toDoList;
    });
  }

  // search function
  void _runFilter(String enteredKeyword) {
    List results;
    if (enteredKeyword.isEmpty) {
      results = db.toDoList;
    } else {
      results = db.toDoList
          .where((user) =>
              user[0].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  // save the task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _firstNameController.text,
        int.parse(_idController.text),
        _jobController.text,
        _numberController.text,
      ]);
      _firstNameController.clear();
      _idController.clear();
      _jobController.clear();
      _numberController.clear();
      _foundUsers = db.toDoList;
    });
    Navigator.of(context).pop();
    db.updateDataBase();
    print('Updated toDoList: ${db.toDoList}'); // Debug print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
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
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
              hintText: 'Искать',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: _foundUsers.isNotEmpty
            ? ListView.separated(
                separatorBuilder: (context, index) {
                  print(DateTime.now());
                  return const SizedBox(
                    height: 10,
                  );
                },
                shrinkWrap: true,
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) {
                  final itemOf = _foundUsers[index];
                  return WorkerTile(
                    name: itemOf[0],
                    id: itemOf[1],
                    job: itemOf[2],
                    number: itemOf[3],
                  );
                },
              )
            : const Center(
                child: Text('No results found'),
              ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewWorkerPage(
                firstNameController: _firstNameController,
                numberController: _numberController,
                jobController: _jobController,
                idController: _idController,
                onSave: saveNewTask,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          backgroundColor: Color.fromARGB(255, 34, 61, 213),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
