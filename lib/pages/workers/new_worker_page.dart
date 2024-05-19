import 'package:flutter/material.dart';

class NewWorkerPage extends StatefulWidget {
  const NewWorkerPage({
    super.key,
    required this.firstNameController,
    required this.numberController,
    required this.jobController,
    required this.idController,
    required this.onSave,
  });

  final firstNameController;
  final numberController;
  final jobController;
  final idController;
  final VoidCallback onSave;

  @override
  State<NewWorkerPage> createState() => _NewWorkerPageState();
}

class _NewWorkerPageState extends State<NewWorkerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                // name of worker
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: widget.firstNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Имя',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // worker number
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: widget.numberController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Номер Телефона',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // type of job
                DropdownMenu(
                  expandedInsets: EdgeInsets.symmetric(horizontal: 0),
                  hintText: 'Тип сотрудника',
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 'Секретарь', label: 'Секретарь'),
                    DropdownMenuEntry(
                        value: 'It сотрудник', label: 'It сотрудник'),
                    DropdownMenuEntry(value: 'Учитель', label: 'Учитель'),
                    DropdownMenuEntry(value: 'Инженер', label: 'Инженер'),
                  ],
                  controller: widget.jobController,
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // id of workere
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: widget.idController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Id',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            //  add button
            GestureDetector(
              onTap: widget.onSave,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 61, 213),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Добавить',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
