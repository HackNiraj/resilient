import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resilient/constants/fonts.dart';
import 'package:resilient/user/user.dart';

class PostScreen extends StatefulWidget {
  final String imageUrl;
  final User user;
  final String title;
  final String timeStamp;
  PostScreen(this.user, this.title,this.imageUrl, this.timeStamp);
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool changeLikeColor = false;

  getText(String text) {
    if(text.isNotEmpty) {
      return Text(
        widget.title,
        style: TextStyle(
            fontFamily: FontConstants.NUNITOSANS,
            color: Colors.black
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  getContainer(String text) {
    if(text.isNotEmpty) {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Colors.black
              )
          ),
          child: Image.asset(widget.imageUrl)
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.0125),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.width * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.0525,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.0522,
                  backgroundImage:
                  AssetImage(widget.user.imageUrl),
                ),
              ),
                  SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: FontConstants.NUNITOSANS,
                            color: Colors.black
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                        widget.timeStamp,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 9,
                            fontFamily: FontConstants.NUNITOSANS,
                            color: Colors.black
                        ),
                      ),
                          Icon(Icons.notifications, size: 15)
                        ],
                      ),
                    ]
                  )
                ],
              ),
              Icon(Icons.more_vert)
            ],
          ),
          SizedBox(height: 10),
          SizedBox(height: 10),
          getText(widget.title),
          getContainer(widget.imageUrl),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    changeLikeColor = !changeLikeColor;
                  });
                },
                child: Row(
                  children: [
                    Icon(changeLikeColor? Icons.thumb_up_alt_rounded:Icons.thumb_up_alt_outlined, color: Colors.black),
                    Text(
                      "Like",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: FontConstants.NUNITOSANS,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.share),
                    Text(
                      "Share",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: FontConstants.NUNITOSANS,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(Icons.wb_incandescent_outlined),
                    Text(
                      "Suggest",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: FontConstants.NUNITOSANS,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
        ]
      ),
    );
  }
}
