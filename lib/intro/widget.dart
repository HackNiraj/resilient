import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel pageViewModel(String title, String body, String assetname, widget) {
  if (widget == null) {
    return PageViewModel(
      title: title,
      body: body,
      image: _buildImage(assetname),
      decoration: pageDecoration(),
    );
  } else {
    return PageViewModel(
      title: title,
      bodyWidget: widget,
      image: _buildImage(assetname),
      decoration: pageDecoration(),
    );
  }
}

PageDecoration pageDecoration(){
  return PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );
}

Widget _buildImage(String assetName) {
  return Align(
    child: Image.asset('res/assets/images/$assetName.jpg', width: 350.0),
    alignment: Alignment.bottomCenter,
  );
}