import 'package:flutter/cupertino.dart';

class User {
  final String uid;
  final String email;
  final String name;
  final String userName;
  final String imageUrl;
  final bool online;

  User({
    @required this.uid,
    @required this.email,
    @required this.userName,
    @required this.name,
    @required this.imageUrl,
    @required this.online
  });
}