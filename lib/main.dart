import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:module_1/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox('workers');
  var exitBox = await Hive.openBox('exit');
  var enterBox = await Hive.openBox('enter');

  tz.initializeTimeZones();
  tz.setLocalLocation(
      tz.getLocation('Asia/Almaty')); // Set local time zone to Almaty

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
