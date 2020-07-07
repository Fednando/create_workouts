import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _formKey1 = GlobalKey<FormState>();

  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();

  final _formKey6 = GlobalKey<FormState>();

  final edT1 = TextEditingController();

  final edT2 = TextEditingController();

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
    return
      ListView(
        children: <Widget>[
          _textFieldView(_formKey1, _formKey2),
          _textFieldView(_formKey3, _formKey4),
          _textFieldView(_formKey5, _formKey6),
        ],
      );

  }

  _textFieldView(GlobalKey<FormState> formKey1, GlobalKey<FormState> formKey2){
    return Container(
      margin: EdgeInsets.all(16),
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Form(
              key: formKey1,
              child: TextFormField(
                validator: validate,
                controller: edT1,
                style: TextStyle(color: Colors.blue, fontSize: 26),
              ),
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Form(
              key: formKey2,
              child: TextFormField(
                validator: validate,
                controller: edT2,
                style: TextStyle(color: Colors.blue, fontSize: 26),
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("ok"),
              onPressed: () => {
                _validateForm2()
              },
            ),
          )
        ],
      ),
    );
  }

  _validateForm1(){
    if(!_formKey1.currentState.validate()){
      return;
    }
  }

  _validateForm2(){
    if(!_formKey1.currentState.validate()){
      return;
    }
    if(!_formKey2.currentState.validate()){
      return;
    }
    if(!_formKey3.currentState.validate()){
      return;
    }
    if(!_formKey4.currentState.validate()){
      return;
    }
    if(!_formKey5.currentState.validate()){
      return;
    }
    if(!_formKey6.currentState.validate()){
      return;
    }

    return null;
  }

  String validate(String text){
    if(text.isEmpty){
      return "Error";
    }
    return null;
  }
}
