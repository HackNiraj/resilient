import 'dart:io';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resilient/constants/app_constants.dart';
import 'package:resilient/constants/fonts.dart';
import 'package:resilient/main_app_screen/widgets.dart';

import 'home/home_page.dart';

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {

  File _image;
  String selectedCountryCode;
  String _currentSelectedGender = AppConstants.GENDER[0];
  String _selectedBloodGroup = AppConstants.BLOOD_GROUP[0];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.grey[200],
                              child: (_image != null
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                              )
                                  :
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              )
                              ))),
                        ),
                      SizedBox(height: 50),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        decoration: inputDecoration('Name', true, "Please provide correct name."),
                        cursorColor: Colors.black,
                        onChanged: (val) {

                        },
                        keyboardType: TextInputType.name,
                        style: new TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: CountryListPick(
                              appBar: AppBar(
                                backgroundColor: Colors.black,
                                title: Text('Select Country', style: TextStyle(color: Colors.white)),
                              ),
                              theme: CountryTheme(
                                alphabetSelectedBackgroundColor: Colors.black,
                                isShowFlag: true,
                                isShowTitle: false,
                                isShowCode: false,
                                isDownIcon: true,
                                showEnglishName: true,
                              ),
                              initialSelection: '+91',
                              onChanged: (CountryCode code) {
                                print(code.name);
                                print(code.code);
                                print(code.dialCode);
                                print(code.flagUri);
                                selectedCountryCode = code.dialCode;
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.black,
                                cursorHeight: 20,
                                decoration: inputDecoration('Phone', true, "Please enter correct Number"),
                                onChanged: (value) {

                                }
                            ),
                          )
                        ],
                      ),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        decoration: inputDecoration('Email', true, "Please provide correct email."),
                        cursorColor: Colors.black,
                        onChanged: (val) {
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(25)],
                        decoration: inputDecoration('Username', true, "Please provide correct username"),
                        cursorColor: Colors.black,
                        onChanged: (val) {
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("D.O.B :", style: TextStyle(
                              fontFamily: FontConstants.NUNITOSANS,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )),
                          Text(DateTime.now().year.toString(), style: TextStyle(
                              fontFamily: FontConstants.NUNITOSANS,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )),
                          IconButton(
                              icon: Icon(Icons.date_range_rounded),
                              onPressed: () {}
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox( width: 120, height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: PopupMenuButton(
                                itemBuilder: (context) {
                                  return AppConstants.GENDER.map((value) {
                                    return PopupMenuItem(
                                        value: value,
                                        child: text(value)
                                    );
                                  }).toList();
                                },
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    text(_currentSelectedGender),
                                    Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                                  ],
                                ),
                                onSelected: (val) {
                                  setState(() {
                                    _currentSelectedGender = val;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox( width: 120, height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: PopupMenuButton(
                                itemBuilder: (context) {
                                  return AppConstants.BLOOD_GROUP.map((value) {
                                    return PopupMenuItem(
                                        value: value,
                                        child: text(value)
                                    );
                                  }).toList();
                                },
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    text(_selectedBloodGroup),
                                    Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                                  ],
                                ),
                                onSelected: (val) {
                                  setState(() {
                                    _selectedBloodGroup = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      SizedBox(height: 40,width: 160,
                          child: RaisedButton(
                            child: Text(
                                "Save",
                                style: TextStyle(
                                    fontFamily: FontConstants.NUNITOSANS,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                )
                            ),
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserHomePage()), (_) => false);
                            },
                            color: Colors.black,
                          )
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
