import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer_util.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'intro/resilient_intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.black);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
            builder: (context, orientation) {
              SizerUtil().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Resilient Group',
                theme: ThemeData(
                    primaryColor: Colors.black,
                    accentColor: Color(0xFFFEF9EB)
                ),
                home: AfterSlpashScreen(),
              );
            }
        );
      },
    );
  }
}

class AfterSlpashScreen extends StatefulWidget {
  @override
  _AfterSlpashScreen createState() => new _AfterSlpashScreen();
}

class _AfterSlpashScreen extends State<AfterSlpashScreen> {

  Future<Widget> loadFromFuture() async {
    return Future.value(new OnBoardingPage());
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.black);
    return new SplashScreen(
        navigateAfterFuture: loadFromFuture(),
        title: new Text('Resilient',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          )),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }
}