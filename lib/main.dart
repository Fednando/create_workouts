import 'dart:ffi';

import 'package:createworkouts/page/list_workout/list_workout.dart';
import 'package:createworkouts/page/tab_week/tab_week_page.dart';
import 'package:createworkouts/page/workout_page/workout_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.white),
        home: TabWeekPage());
  }

}