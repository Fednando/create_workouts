

import 'dart:async';

import 'package:createworkouts/db/workout_dao.dart';
import 'package:createworkouts/model/Workout.dart';

class ListWorkoutBloc{

  final workoutDao = WorkoutDao();

  final _listWorkoutController = StreamController<List<Workout>>();

  Stream<List<Workout>> get listWorkoutStream => _listWorkoutController.stream;

  listWorkout(String dayOfWeek) async {
    var listWorkout = await workoutDao.findAllByDayOfWeek(dayOfWeek);
    print("    *****************************88   $dayOfWeek");


    print("    element    ${listWorkout.length}");

    _listWorkoutController.add(listWorkout);
    return listWorkout;
  }
}