import 'package:hive_flutter/hive_flutter.dart';

class WorkersDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('workers');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Петя", 101, "Учитель", "8-708-202-2022"],
      ["Арлан", 102, "Секретарь", "8-708-202-2843"],
      ["Вася", 103, "It сотрудник", "8-777-232-2303"],
      ["Артем", 104, "Инженер", "8-729-642-3503"],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("WORKERS");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("WORKERS", toDoList);
  }
}
