import 'package:flutter/material.dart';
import 'package:resilient/chat_messenger/recent_chats.dart';
import 'package:resilient/constants/fonts.dart';

class ChatApplication extends StatefulWidget {
  @override
  _ChatApplicationState createState() => _ChatApplicationState();
}

class _ChatApplicationState extends State<ChatApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Chats',
          style: TextStyle(
              fontFamily: FontConstants.NUNITOSANS,
              fontSize: 28,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              // showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text("MESSAGES",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.NUNITOSANS,
                          letterSpacing: 0.5)),
                ),
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
