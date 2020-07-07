import 'dart:io';

import 'package:createworkouts/model/Workout.dart';
import 'package:createworkouts/page/list_workout/list_workout_bloc.dart';
import 'package:createworkouts/page/workout_page/workout_page.dart';
import 'package:createworkouts/utils/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWorkout extends StatefulWidget {
  String dayOfWeek;

  ListWorkout(this.dayOfWeek);

  @override
  _ListWorkoutState createState() => _ListWorkoutState();
}

class _ListWorkoutState extends State<ListWorkout>
    with AutomaticKeepAliveClientMixin<ListWorkout> {
  final listWorkoutBloc = ListWorkoutBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    listWorkoutBloc.listWorkout(widget.dayOfWeek);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Container(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<List<Workout>>(
            stream: listWorkoutBloc.listWorkoutStream,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data != null ? snapshot.data.length : 0,
                itemBuilder: (context, index) {
                  final workout = snapshot.data[index];
                  return ListTile(
                    leading: _imageView(workout),
                    title: Text(_getName(workout)),
                    subtitle: Text("Description"),
                    onTap: () => {push(context, WorkoutPage(workout: workout))},
                  );
                },
              );
            }),
      ),
    );
  }

  _imageView(Workout workout) {
    if (workout.photo != null) {
      return Image.file(File(workout.photo), width: 50, height: 50, fit: BoxFit.cover,);
    } else {
      return Image.asset("assets/images/ic_photo.png");
    }
  }

  Future<void> _onRefresh() {
    return listWorkoutBloc.listWorkout(widget.dayOfWeek);
  }

  String _getName(Workout workout) {
    if (workout != null && workout.name != null) {
      return workout.name;
    }
    return "Name workout";
  }
}
