
import 'dart:async';
import 'dart:io';

import 'package:createworkouts/db/workout_dao.dart';
import 'package:createworkouts/model/Workout.dart';
import 'package:createworkouts/model/day_of_week.dart';

import 'button_state.dart';

class WorkoutBloc{

  final _indexDaysOfWeekSelected = StreamController<int>();
  final _absorbingForm2Controller = StreamController<bool>();
  final _absorbingForm3Controller = StreamController<bool>();
  final _buttonState1Controller = StreamController<ButtonState>();
  final _buttonState2Controller = StreamController<ButtonState>();
  final _buttonState3Controller = StreamController<ButtonState>();
  final _fileController = StreamController<File>();


  final WorkoutDao workoutDao = WorkoutDao();

  final listOfDays = [DayOfWeek.MONDAY, DayOfWeek.TUESDAY, DayOfWeek.WEDNESDAY, DayOfWeek.THUSDAY, DayOfWeek.FRIDAY];

  get fileStream => _fileController.stream;
  get indexSelected => _indexDaysOfWeekSelected.stream;
  get absorbingForm2 => _absorbingForm2Controller.stream;
  get absorbingForm3 => _absorbingForm3Controller.stream;

  get buttonState1 => _buttonState1Controller.stream;
  get buttonState2 => _buttonState2Controller.stream;
  get buttonState3 => _buttonState3Controller.stream;

  setFile(File file){
    _fileController.add(file);
  }

  changeButtonState1(ButtonState buttonState){
    _buttonState1Controller.add(buttonState);
  }

  changeButtonState2(ButtonState buttonState){
    _buttonState2Controller.add(buttonState);
  }

  changeButtonState3(ButtonState buttonState){
    _buttonState3Controller.add(buttonState);
  }

  int setDayOfWeek(String dayOfWeek){
    int index = listOfDays.indexOf(dayOfWeek);
    _indexDaysOfWeekSelected.add(index);
    return index;
  }

  setIndex(int index){
    _indexDaysOfWeekSelected.add(index);
  }

  setAbsoringForm2(bool absorbing){
    _absorbingForm2Controller.add(absorbing);
  }
  setAbsoringForm3(bool absorbing){
    _absorbingForm3Controller.add(absorbing);
  }

  saveWorkout(Workout workout) async {
//    if(workout.id != null){
//      return await workoutDao.update(workout);
//    }else{
      return await workoutDao.save(workout);
  }
}