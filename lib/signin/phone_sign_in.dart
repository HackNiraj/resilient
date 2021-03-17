import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_view/pin_view.dart';
import 'package:resilient/constants/app_constants.dart';
import 'package:resilient/constants/fonts.dart';
import 'package:resilient/main_app_screen/main_app_screen.dart';

class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {

  void getOtp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
                    Text(
                      AppConstants.ENTER_OTP_LABEL,
                      style: TextStyle(fontFamily: FontConstants.NUNITOSANS, fontSize: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
                    PinView(
                        autoFocusFirstField: true,
                        submit: (String pin) {
                          print(pin);
                        },
                        count: 6
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainAppScreen()), (route) => false);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Material(
                            borderRadius: BorderRadius.circular(4.0),
                            shadowColor: Theme.of(context).primaryColor,
                            color: Theme.of(context).primaryColor,
                            elevation: 7.0,
                            child: Center(
                                child: Text(
                                    AppConstants.SUBMIT_OTP_BUTTON_LABEL,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontConstants.NUNITOSANS,
                                        fontSize: 14)
                                ))
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
                    InkWell(
                      onTap: (){

                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppConstants.RESEND_OTP,
                        ),
                      ),
                    )
                  ]
              )
            )
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Text(
                    AppConstants.ENTER_PHONE_LABEL,
                    style: TextStyle(
                        fontFamily: FontConstants.NUNITOSANS, fontSize: 20),
              )),
              SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Center(
                          child: CountryListPick(
                            appBar: AppBar(
                              backgroundColor: Colors.black,
                              title: Text('Select Country',
                                  style: TextStyle(color: Colors.white)),
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
                            },
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          cursorHeight: MediaQuery.of(context).size.width * 0.05 + MediaQuery.of(context).size.width * 0.005,
                          readOnly: false,
                          decoration: InputDecoration(
                            errorText: "Please Check Your Number Or Try Again Later.",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(width: 1, color: Colors.black),
                            ),
                            focusColor: Colors.black,
                            hintText: "Phone Number",
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
              InkWell(
                onTap: (){
                  getOtp(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Material(
                      borderRadius: BorderRadius.circular(4.0),
                      shadowColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).primaryColor,
                      elevation: 7.0,
                      child: Center(
                          child: Text(
                        AppConstants.GET_OTP_BUTTON_LABEL,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 14)
                      ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
