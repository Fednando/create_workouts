import 'package:createworkouts/db/entity.dart';

class Workout extends Entity{
  int id;
  String name;
  String description;
  String dayOfWeek;
  String photo;
  int lb1;
  int reps1;
  int lb2;
  int reps2;
  int lb3;
  int reps3;


  Workout({this.id, this.name, this.description, this.dayOfWeek, this.photo,
      this.lb1, this.reps1, this.lb2, this.reps2, this.lb3, this.reps3});

  Workout.fromMap(Map<String, dynamic> json) {
    print("json  $json");
    id =    json['id'];
    name = json['name'];
    description = json['description'];
    dayOfWeek = json['day_of_week'];
    photo = json['photo'];
    lb1    = json['lb1'];
    reps1  = json['reps1'];
    lb2    = json['lb2'];
    reps2  = json['reps2'];
    lb3    = json['lb3'];
    reps3  = json['reps3'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['day_of_week'] = this.dayOfWeek;
    data['photo'] = this.photo;
    data['lb1'] = this.lb1;
    data['reps1'] = this.reps1;
    data['lb2'] = this.lb2;
    data['reps2'] = this.reps2;
    data['lb3'] = this.lb3;
    data['reps3'] = this.reps3;
    return data;
  }

}