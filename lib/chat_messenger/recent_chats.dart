import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resilient/constants/fonts.dart';

class RecentChats extends StatefulWidget {
  @override
  _RecentChats createState() => _RecentChats();

}

class _RecentChats extends State<RecentChats> {
  var contact = {
    'name': 'Niraj Kumar',
    'photoUrl': '',
    'last message': 'Hi',
    'time': DateFormat('jm').format(DateTime.now())
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
          )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
        ),
        child: contact.isNotEmpty? Container(
            height: 100,
            child: RecentChatTile()
        ) :
        Container(child: Center(child: Text('No Person To chat')))
      ),
    );
  }
}


class RecentChatTile extends StatelessWidget {
  RecentChatTile();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {

      },
      color: Color(0xFFFFEFEE),
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.lightGreen,
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("res/assets/images/steven.jpg")
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Niraj Kumar',
                      style: TextStyle(
                          fontFamily: FontConstants.NUNITOSANS,
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        'Hello',
                        style: TextStyle(
                            fontFamily: FontConstants.NUNITOSANS,
                            color: Colors.blueGrey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
                children: <Widget>[
                  Text(
                    DateFormat('jm').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: FontConstants.NUNITOSANS,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5),
                  (true?
                  Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'NEW',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontConstants.NUNITOSANS,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ): SizedBox.shrink()
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}
