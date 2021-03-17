import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resilient/constants/fonts.dart';
import 'package:resilient/custom_widgets/custom_icons.dart';

class PostComposer extends StatefulWidget {
  @override
  _PostComposerState createState() => _PostComposerState();
}

class _PostComposerState extends State<PostComposer>
    with TickerProviderStateMixin {
  String changeValue = "1";
  bool postCreated = false;
  bool increaseHeight = false;
  TextEditingController textEdittingController = new TextEditingController();
  bool attachFile = false;
  DateTime addTime;
  bool increaseContainer = false;
  bool increaseTextfield = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        setState(() {
          attachFile = false;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Center(
              child: Text("Create",
                  style: TextStyle(
                      fontFamily: FontConstants.NUNITOSANS,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white))),
        ),
        floatingActionButton: attachFile == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        attachFile = true;
                      });
                    },
                  ),
                  SizedBox(height: 60)
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
                            .animate(AnimationController(
                                vsync: this,
                                duration: Duration(milliseconds: 300))
                              ..forward()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FloatingActionButton(
                          child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color(int.parse('FF3EAA58', radix: 16)),
                              ),
                              child: Icon(Icons.location_on)),
                          onPressed: () {
                            setState(() {
                              increaseContainer = true;
                              attachFile = false;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        FloatingActionButton(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Color(int.parse('FFD82442', radix: 16)),
                            ),
                            child: Icon(Icons.camera),
                          ),
                          onPressed: () {
                            setState(() {
                              increaseContainer = true;
                              attachFile = false;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        FloatingActionButton(
                          child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color(int.parse('FFDEAA2F', radix: 16)),
                              ),
                              child: Icon(CustomIcons.file_alt)),
                          onPressed: () {
                            setState(() {
                              increaseContainer = true;
                              attachFile = false;
                            });
                          },
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
                  ),
                  FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          attachFile = false;
                        });
                      }),
                  SizedBox(height: 60)
                ],
              ),
        body: Container(
          color: Color(int.parse('FFF0F2F5', radix: 16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.025),
                decoration: BoxDecoration(
                    color: Colors.white, border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.026,
                            backgroundImage:
                                AssetImage("res/assets/images/steven.jpg")),
                        SizedBox(width: 8),
                        Text(
                          "Steven",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: FontConstants.NUNITOSANS,
                              color: Colors.black),
                        )
                      ],
                    ),
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: increaseTextfield && !increaseContainer
                    ? MediaQuery.of(context).size.height * 0.12: (!increaseContainer? MediaQuery.of(context).size.height * 0.25
                    : MediaQuery.of(context).size.height * 0.48),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.0285),
                  children: [
                    TextFormField(
                        controller: textEdittingController,
                        autofocus: true,
                        maxLines: textEdittingController.text.split('\n').length < 6? null: 6,
                        cursorHeight: MediaQuery.of(context).size.height * 0.027,
                        style: TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        cursorColor: Colors.blueGrey,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.height * 0.01,
                              vertical: MediaQuery.of(context).size.height * 0.01),
                          labelText: "Write a Post",
                          alignLabelWithHint: true,
                          prefixIcon: Icon(Icons.face),
                          labelStyle: TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          hintStyle: TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1
                            )
                          ),
                        ),
                        onTap: () {
                          if(attachFile) {
                            setState(() {
                              attachFile = false;
                            });
                          }
                          if (!increaseHeight) {
                            setState(() {
                              increaseHeight = true;
                            });
                          }
                        },
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              postCreated = true;
                            });
                          } else {
                            setState(() {
                              postCreated = false;
                            });
                          }
                          if(textEdittingController.text.isEmpty) {
                            setState(() {
                              increaseTextfield = true;
                            });
                          } else {
                            setState(() {
                              increaseTextfield = false;
                            });
                          }
                        }),
                    // TODO ADD CONTAINER FOR IMAGE AND LOCATION
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.037),
                child: InkWell(
                    onTap: () {
                      if (postCreated) {
                        print('isclickable');
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: postCreated ? Colors.black : Colors.grey,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text('Post',
                            style: TextStyle(
                                fontFamily: FontConstants.NUNITOSANS,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
