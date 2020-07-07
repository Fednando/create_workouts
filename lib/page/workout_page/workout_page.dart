import 'dart:io';

import 'package:createworkouts/model/Workout.dart';
import 'package:createworkouts/page/timer/time_rest.dart';
import 'package:createworkouts/page/workout_page/workout_bloc.dart';
import 'package:createworkouts/widgets/alert.dart';
import 'package:createworkouts/widgets/text_form_field_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'button_state.dart';

class WorkoutPage extends StatefulWidget {
  final Workout workout;

  WorkoutPage({this.workout});

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();

  final _formNameWorkoutKey = GlobalKey<FormState>();

  int indexSelected = -1;

  final workoutBloc = WorkoutBloc();
  final edTLb1 = TextEditingController();
  final edTRp1 = TextEditingController();

  final edTLb2 = TextEditingController();
  final edTRp2 = TextEditingController();

  final edTLb3 = TextEditingController();
  final edTRp3 = TextEditingController();
  final _edTNameWorkoutController = TextEditingController();
  PickedFile pathImage = null;

  Workout get workout => widget.workout;


  @override
  void initState() {
    super.initState();

    if (workout != null) {
      _edTNameWorkoutController.text = workout.name;

      indexSelected = workoutBloc.setDayOfWeek(workout.dayOfWeek);
      edTLb1.text = workout.lb1.toString();
      edTRp1.text = workout.reps1.toString();
      edTLb2.text = workout.lb2.toString();
      edTRp2.text = workout.reps2.toString();
      edTLb3.text = workout.lb3.toString();
      edTRp3.text = workout.reps3.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              StreamBuilder<File>(
                initialData: workout != null ? File(workout.photo) : null,
                stream: workoutBloc.fileStream,
                builder: (context, snapshot) {
                  return InkWell(
                    onTap: onClickImage,
                    child: _imageView(snapshot.data),
                  );
                }
              ),
              SizedBox(width: 10,),
              SizedBox( width: 250,
                child: Form(
                  key: _formNameWorkoutKey,
                  child: TextFormField(controller: _edTNameWorkoutController,
                    validator: _validateForm,
                    style: TextStyle(color: Colors.blue, fontSize: 26),
                    decoration: InputDecoration(hintText: "Workout Name"),),
                ),
              ),
            ],
          ),
          _choiceChipView(),
          Container(
            width: double.infinity,
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Form(
                    key: _formKey1,
                    child: TextFormFieldApp(edTLb1, _validateForm),
                  ),
                ),
                Container(
                    height: 40,
                    child: VerticalDivider(
                      width: 30,
                      thickness: 2,
                    )),
                Expanded(
                  child: Form(
                    key: _formKey2,
                    child: TextFormFieldApp(edTRp1, _validateForm),
                  ),
                ),
                Container(
                    height: 40,
                    child: VerticalDivider(
                      width: 30,
                      thickness: 2,
                    )),
                Expanded(
                  child: Container(
                    height: 46,
                    child: StreamBuilder<ButtonState>(
                        initialData: ButtonState.PLAY,
                        stream: workoutBloc.buttonState1,
                        builder: (context, snapshotButtonState) {
                          return RaisedButton(
                              color: Colors.blue,
                              child: _buttonStateFormValidate(
                                  snapshotButtonState.data),
                              onPressed: () =>
                                  _onClickForm1(snapshotButtonState.data));
                        }),
                  ),
                )
              ],
            ),
          ),
          StreamBuilder<bool>(
              initialData: true,
              stream: workoutBloc.absorbingForm2,
              builder: (context, snapshot) {
                return AbsorbPointer(
                  absorbing: snapshot.data,
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Form(
                            key: _formKey3,
                            child: TextFormFieldApp(edTLb2, _validateForm),
                          ),
                        ),
                        Container(
                            height: 40,
                            child: VerticalDivider(
                              width: 30,
                              thickness: 2,
                            )),
                        Expanded(
                          child: Form(
                            key: _formKey4,
                            child: TextFormFieldApp(edTRp2, _validateForm),
                          ),
                        ),
                        Container(
                            height: 40,
                            child: VerticalDivider(
                              width: 30,
                              thickness: 2,
                            )),
                        Expanded(
                          child: Container(
                            height: 46,
                            child: StreamBuilder<ButtonState>(
                                initialData: ButtonState.DISABLE,
                                stream: workoutBloc.buttonState2,
                                builder: (context, snapshotButtonState2) {
                                  return RaisedButton(
                                      color: snapshot.data
                                          ? Colors.grey
                                          : Colors.blue,
                                      child: _buttonStateFormValidate(
                                          snapshotButtonState2.data),
                                      onPressed: () => _onClickForm2(
                                          snapshotButtonState2.data));
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          StreamBuilder<bool>(
              initialData: true,
              stream: workoutBloc.absorbingForm3,
              builder: (context, snapshot) {
                return AbsorbPointer(
                  absorbing: snapshot.data,
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Form(
                            key: _formKey5,
                            child: TextFormFieldApp(edTLb3, _validateForm),
                          ),
                        ),
                        Container(
                            height: 40,
                            child: VerticalDivider(
                              width: 30,
                              thickness: 2,
                            )),
                        Expanded(
                          child: Form(
                            key: _formKey6,
                            child: TextFormFieldApp(edTRp3, _validateForm),
                          ),
                        ),
                        Container(
                            height: 40,
                            child: VerticalDivider(
                              width: 30,
                              thickness: 2,
                            )),
                        Expanded(
                          child: Container(
                            height: 46,
                            child: StreamBuilder<ButtonState>(
                                initialData: ButtonState.DISABLE,
                                stream: workoutBloc.buttonState3,
                                builder: (context, snapshotButtonState) {
                                  return RaisedButton(
                                      color: snapshot.data
                                          ? Colors.grey
                                          : Colors.blue,
                                      child: _buttonStateFormValidate(
                                          snapshotButtonState.data),
                                      onPressed: () => _onClickSaveWorkout(
                                          snapshotButtonState.data));
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  _buttonStateFormValidate(ButtonState buttonState) {
    if (buttonState == ButtonState.PLAY || buttonState == ButtonState.DISABLE) {
      return Icon(Icons.arrow_right, color: Colors.white, size: 36);
    } else if (buttonState == ButtonState.DID) {
      return Text(
        "Dit it",
        style: TextStyle(color: Colors.white),
      );
    } else if (buttonState == ButtonState.COMPLETED) {
      return Icon(Icons.check, color: Colors.white, size: 26);
    }

    return null;
  }

  _choiceChipView() {
    return StreamBuilder<int>(
        stream: workoutBloc.indexSelected,
        builder: (context, snapshot) {
          return Row(
              children: List.generate(workoutBloc.listOfDays.length, (index) {
            return Expanded(
              child: ChoiceChip(
                padding: EdgeInsets.only(left: 12, right: 12),
                shape: BeveledRectangleBorder(),
                disabledColor: Colors.lightBlue,
                backgroundColor: Colors.lightBlueAccent.withAlpha(180),
                selectedColor: Colors.blue,
                label: Text(
                  workoutBloc.listOfDays[index].substring(0, 1),
                  style: TextStyle(color: Colors.white),
                ),
                selected: snapshot.data == index,
                onSelected: (bool selected) {
                  indexSelected = index;
                  workoutBloc.setIndex(index);
                },
              ),
            );
          }));
        });
  }

  _onClickForm1(ButtonState buttonState) {
    if (indexSelected == -1) {
      alertSimple(context, "Selecione o dia da semana");
      return null;
    }

    if (!_formKey1.currentState.validate() ||
        !_formKey2.currentState.validate()) {
      return "error";
    }

    if (buttonState == ButtonState.PLAY) {
      workoutBloc.changeButtonState1(ButtonState.DID);
    } else if (buttonState == ButtonState.DID) {
      _startTransparentPage();
      workoutBloc.changeButtonState1(ButtonState.COMPLETED);
      workoutBloc.changeButtonState2(ButtonState.PLAY);
      workoutBloc.setAbsoringForm2(false);
    }

    return null;
  }

  _onClickForm2(ButtonState buttonState) {
    if (!_formKey3.currentState.validate() ||
        !_formKey4.currentState.validate()) {
      return "error";
    }

    if (buttonState == ButtonState.PLAY) {
      workoutBloc.changeButtonState2(ButtonState.DID);
    } else if (buttonState == ButtonState.DID) {
      _startTransparentPage();
      workoutBloc.changeButtonState2(ButtonState.COMPLETED);
      workoutBloc.changeButtonState3(ButtonState.PLAY);
      workoutBloc.setAbsoringForm3(false);
    }

    return null;
  }

  _startTransparentPage(){
    Navigator.of(context).push(
      PageRouteBuilder(
        barrierColor: Colors.black.withOpacity(0.5),
        opaque: false, // set to false
        pageBuilder: (_, __, ___) => TimeRest(),
      ),
    );
  }

  String _validateForm(String text) {
    if (text.isEmpty) {
      return "Empty field";
    }
    return null;
  }

  _imageView(File file) {
    if(file != null) {
      return Image.file(file, height: 100, width: 100, fit: BoxFit.cover,);
    }else if(workout != null && workout.photo.isNotEmpty) {
      return Image.file(File(workout.photo), height: 100, width: 100, fit: BoxFit.cover);
    }
    return Image.asset("assets/images/ic_photo.png", height: 100, width: 100, fit: BoxFit.cover);
  }

  onClickImage()async {
    alertDialog(context,
                "Take a Picture",
                "Choose one of the options",
                "Gallery",
                (){
                  _awaitImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                "Camera",
                (){
                  _awaitImage(ImageSource.camera);
                  Navigator.pop(context);
                });
  }

  _awaitImage(ImageSource typeImage) async{
    pathImage = await ImagePicker().getImage(source: typeImage);
    workoutBloc.setFile(File(pathImage.path));
  }

  _onClickSaveWorkout(ButtonState buttonState) async {
    if (!_formKey5.currentState.validate() ||
        !_formKey6.currentState.validate() ||
        !_formNameWorkoutKey.currentState.validate()) {
      return "error";
    }

    if (buttonState == ButtonState.PLAY) {
      workoutBloc.changeButtonState3(ButtonState.DID);
      _startTransparentPage();
    } else if (buttonState == ButtonState.DID) {
      var newWorkout = workout ?? Workout();
      newWorkout.photo = pathImage != null ? pathImage.path : "";
      newWorkout.name = _edTNameWorkoutController.text;
      newWorkout.lb1 = int.parse(edTLb1.text);
      newWorkout.reps1 = int.parse(edTRp1.text);
      newWorkout.lb2 = int.parse(edTLb2.text);
      newWorkout.reps2 = int.parse(edTRp2.text);
      newWorkout.lb3 = int.parse(edTLb3.text);
      newWorkout.reps3 = int.parse(edTRp3.text);

      newWorkout.dayOfWeek = workoutBloc.listOfDays[indexSelected];

      int id = await workoutBloc.saveWorkout(newWorkout);
      workoutBloc.changeButtonState3(ButtonState.COMPLETED);
      print("  id  $id");
      if (id == null || id == 0) {
        alertSimple(context, "Ocorreu um erro.");
      }
    }
  }
}
