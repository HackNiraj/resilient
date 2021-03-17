import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:resilient/constants/app_constants.dart';
import 'package:resilient/constants/fonts.dart';
import 'package:resilient/constants/images.dart';
import 'package:resilient/signin/phone_sign_in.dart';
import 'package:sizer/sizer_util.dart';

class SignInPage extends StatefulWidget {
  final bool alreadyRegistered;
  SignInPage(this.alreadyRegistered);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.black);
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return Scaffold(
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(25.0),
                        shadowColor: Colors.transparent,
                        color: Colors.black,
                        elevation: 7.0,
                        child: Center(
                          child: Text('Logo & Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontConstants.NUNITOSANS)),
                        ),
                      ),
                    ),
                    LogInContainer(widget.alreadyRegistered),
                    SizedBox(height: MediaQuery.of(context).size.height * (0.028))
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Text(AppConstants.NEED_HELP,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 11,
                            fontWeight: FontWeight.normal)),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ));
        });
      }),
    );
  }
}

class LogInContainer extends StatelessWidget {
  final bool alreadyRegistered;
  LogInContainer(this.alreadyRegistered);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text((alreadyRegistered? AppConstants.LOG_IN: AppConstants.CREATE_ACCOUNT),
              style: TextStyle(
                  fontFamily: FontConstants.NUNITOSANS,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppConstants.TXT_1EN_SIGNIN,
                style: TextStyle(
                    fontSize: 9, fontFamily: FontConstants.NUNITOSANS),
              ),
              InkWell(
                child: Text(
                  AppConstants.TERMS_AND_CONDITION + ".",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 9,
                      fontFamily: FontConstants.NUNITOSANS),
                ),
                onTap: () {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppConstants.TXT_2EN_SIGNUP,
                style: TextStyle(
                    fontSize: 9, fontFamily: FontConstants.NUNITOSANS),
              ),
              InkWell(
                child: Text(
                  AppConstants.PRIVACY_POLICY,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 9,
                      fontFamily: FontConstants.NUNITOSANS),
                ),
                onTap: () {},
              ),
              Text(
                AppConstants.AND,
                style: TextStyle(
                    fontSize: 9, fontFamily: FontConstants.NUNITOSANS),
              ),
              InkWell(
                child: Text(
                  AppConstants.COOKIE_POLICY,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 9,
                      fontFamily: FontConstants.NUNITOSANS),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
          LogInOptions(),
          SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
          InkWell(
              onTap: () {
                if(alreadyRegistered == false){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(true)));
                }
              },
              child: Text((alreadyRegistered? AppConstants.HAVING_TROUBLE: AppConstants.ALREADY_REGISTERED),
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: FontConstants.NUNITOSANS,
                      fontSize: 11,
                      fontWeight: FontWeight.normal))),
          SizedBox(height: MediaQuery.of(context).size.height * (0.028))
        ],
      ),
    );
  }
}

class LogInOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0)
              ),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Image.asset(
                        ImagesConstants.Google,
                        height: 18.0,
                      ),
                      Spacer(),
                      Text(AppConstants.LOG_IN_WITH + AppConstants.GOOGLE,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: FontConstants.NUNITOSANS,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Spacer()
                    ],
                  )),
            ),
            onTap: () {},
          ),
          SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
          InkWell(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Image.asset(
                        ImagesConstants.Facebook,
                        height: 18.0,
                      ),
                      Spacer(),
                      Text(AppConstants.LOG_IN_WITH + AppConstants.FACEBOOK,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: FontConstants.NUNITOSANS,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Spacer()
                    ],
                  )),
            ),
            onTap: () {},
          ),
          SizedBox(height: MediaQuery.of(context).size.height * (0.028)),
          InkWell(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2.0),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width*0.05),
                    Image.asset(
                      ImagesConstants.Phone,
                      height: 18.0,
                    ),
                    Spacer(),
                    Text(AppConstants.LOG_IN_WITH + AppConstants.PHONE,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontConstants.NUNITOSANS,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Spacer()
                  ],
                )),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneLogin()));
            },
          )
        ],
      ),
    );
  }
}
