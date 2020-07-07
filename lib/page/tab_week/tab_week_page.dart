

import 'package:createworkouts/model/day_of_week.dart';
import 'package:createworkouts/page/list_workout/list_workout.dart';
import 'package:createworkouts/page/workout_page/workout_page.dart';
import 'package:createworkouts/utils/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabWeekPage extends StatefulWidget {
  @override
  _TabWeekPageState createState() => _TabWeekPageState();
}

class _TabWeekPageState extends State<TabWeekPage> with SingleTickerProviderStateMixin<TabWeekPage>{

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();

  }

  _initTabs() async {

    _tabController = TabController(length: 5, vsync: this);

    setState(() {
      _tabController.index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout"),
        bottom: _tabController == null ? null:
        TabBar(controller: _tabController, tabs: <Widget>[
          Tab(text: DayOfWeek.MONDAY.substring(0, 3),),
          Tab(text: DayOfWeek.TUESDAY.substring(0, 3),),
          Tab(text: DayOfWeek.WEDNESDAY.substring(0, 3),),
          Tab(text: DayOfWeek.THUSDAY.substring(0, 3),),
          Tab(text: DayOfWeek.FRIDAY.substring(0, 3),),
        ],),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          push(context, WorkoutPage())
        },
      ),
    );
  }

  _body() {
    return TabBarView(
        controller: _tabController,
        children: [
          ListWorkout(DayOfWeek.MONDAY),
          ListWorkout(DayOfWeek.TUESDAY),
          ListWorkout(DayOfWeek.WEDNESDAY),
          ListWorkout(DayOfWeek.THUSDAY),
          ListWorkout(DayOfWeek.FRIDAY),
        ]);
  }
}
