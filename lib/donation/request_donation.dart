import 'package:flutter/material.dart';
import 'package:resilient/constants/fonts.dart';

class GetHelpWithHumans extends StatefulWidget {
  @override
  _GetHelpWithHumansState createState() => _GetHelpWithHumansState();
}

class _GetHelpWithHumansState extends State<GetHelpWithHumans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Raise Request',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: FontConstants.NUNITOSANS,
                    color: Colors.white,
                    letterSpacing: 4
                )
            )
        ),
        backgroundColor: Color(int.parse("FFB60057", radix: 16)),
        elevation: 0.7,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))]
      ),
    );
  }
}
