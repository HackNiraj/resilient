import 'package:flutter/material.dart';
import 'package:resilient/constants/fonts.dart';

class ContributeToHumans extends StatefulWidget {
  @override
  _ContributeToHumansState createState() => _ContributeToHumansState();
}

class _ContributeToHumansState extends State<ContributeToHumans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              "Let's Contribute",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: FontConstants.NUNITOSANS,
                  color: Colors.white,
                  letterSpacing: 4)
          ),
        ),
        backgroundColor: Color(int.parse("FFB60057", radix: 16)),
        elevation: 0.7,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))]
      ),
    );
  }
}
