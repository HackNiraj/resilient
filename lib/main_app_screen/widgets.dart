import 'package:flutter/material.dart';
import 'package:resilient/constants/fonts.dart';

InputDecoration inputDecoration(String value, bool isNameValid, String errorMessage) {
  return InputDecoration(
    labelText: value,
    labelStyle: TextStyle(
        fontFamily: FontConstants.NUNITOSANS,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black
    ),
    errorText: isNameValid? "" : errorMessage,
    fillColor: Colors.black,
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}

Text text(String value) {
  return Text(
    value,
    style: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.NUNITOSANS,
        fontWeight: FontWeight.bold,
        fontSize: 20
    ),
    textAlign: TextAlign.center,
  );
}