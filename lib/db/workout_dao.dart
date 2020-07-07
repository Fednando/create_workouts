

import 'package:createworkouts/db/base_dao.dart';
import 'package:createworkouts/model/Workout.dart';

class WorkoutDao extends BaseDao<Workout> {
  @override
  Workout fromMap(Map<String, dynamic> json) {
    return Workout.fromMap(json);
  }


  @override
  String get tableName => "table_workout";

  Future<List<Workout>> findAllByDayOfWeek(String day) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from $tableName where day_of_week = "$day"');

    final workout = list.map<Workout>((json) => Workout.fromMap(json)).toList();

    return workout;
  }


}