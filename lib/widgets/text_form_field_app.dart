import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldApp extends StatelessWidget {

  TextEditingController _edtController;
  Function _validateForm;

  TextFormFieldApp(this._edtController, this._validateForm);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _edtController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      validator: _validateForm,
      style: TextStyle(color: Colors.blue, fontSize: 26),
      decoration: InputDecoration(),
    );
  }
}
