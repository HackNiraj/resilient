import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resilient/Encryption/encryption.dart';
import 'package:resilient/constants/fonts.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen();
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var messages = [
    'Hello',
    'How are you',
    'Nice talking'
  ];
  String timeStamp = "";
  String text = "";
  bool send = false;
  double changedHeight = 1 / 3;
  bool opened = false;
  String assetImage = "assets/images/download.jpg";
  OverlayState overlayState;
  OverlayEntry _overlayEntry;

  TextEditingController messageController = new TextEditingController();
  

  _buildMessage(String message, bool isMe, bool giveSpace, String timeStamp) {
    Widget msg = Container(
        alignment: true? Alignment.centerRight : Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          color: true ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))
          ),
          margin: true
              ? EdgeInsets.only(bottom: 2, top: true? 8 : 0, left: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.75)
              : EdgeInsets.only(bottom: 2, top: true? 8 : 0, right: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.75),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: Encryption.decryptAES(message) + "    ",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: FontConstants.NUNITOSANS
                          )
                      ),
                      TextSpan(
                          text: DateFormat('jm').format(DateTime.now()),
                          style: TextStyle(
                              color: Colors.transparent
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Text(
                    DateFormat('jm').format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        fontFamily: FontConstants.NUNITOSANS
                    )
                ),
                right: 8.0,
                bottom: 4.0,
              )
            ],
          ),
        ));
    if(timeStamp.isNotEmpty) {
      return Column(
          children: [
            SizedBox(height: 30),
            Card(
              color: Colors.teal,
              child: Text(timeStamp),
            ),
            SizedBox(height: 30),
            msg
          ]);
    } else {
      return msg;
    }
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 7),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 5,
                      color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.face), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                          hintText: "Type Something...", border: InputBorder.none
                      ),
                      onTap: () {
                        if(_overlayEntry != null){
                          _overlayEntry?.remove();
                          _overlayEntry = null;
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {
                      if(_overlayEntry != null) {
                        _overlayEntry.remove();
                        _overlayEntry = null;
                      }
                      FocusScope.of(context).unfocus();
                      final size = MediaQuery.of(context).size;
                      overlayState = Overlay.of(context);
                      _overlayEntry = OverlayEntry(builder: (_) => Positioned(
                          height: size.height * changedHeight,
                          width: size.width * 0.9,
                          left: size.width * 0.1 * 0.5,
                          bottom: size.height * changedHeight / 3.5,
                          child: _popupMenu(size)
                      ));
                      overlayState.insert(_overlayEntry);
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            onTap: (){
              if(RegExp(r"\S").hasMatch(messageController.text)) {
                final encrypt = Encryption.encryptAES(messageController.text);
                messageController.text = encrypt;
                print(encrypt);
              }
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color(int.parse("FF4BB17B", radix: 16)),
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _popupMenu(Size size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOption(Icon(Icons.insert_drive_file, color: Colors.white),
                  'Document', [
                    Color(int.parse('FF5157AE', radix: 16)),
                    Color(int.parse('FF5157AE', radix: 16)),
                    Color(int.parse('FF5F66CD', radix: 16)),
                    Color(int.parse('FF5F66CD', radix: 16))
                  ]),
              _buildOption(
                  Icon(Icons.photo_camera, color: Colors.white), 'Camera', [
                Color(int.parse('FFD3396D', radix: 16)),
                Color(int.parse('FFD3396D', radix: 16)),
                Color(int.parse('FFEC407A', radix: 16)),
                Color(int.parse('FFEC407A', radix: 16))
              ]),
              _buildOption(
                  Icon(Icons.photo, color: Colors.white), 'Gallery', [
                Color(int.parse('FFAC44CF', radix: 16)),
                Color(int.parse('FFAC44CF', radix: 16)),
                Color(int.parse('FFBF59CF', radix: 16)),
                Color(int.parse('FFBF59CF', radix: 16))
              ])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOption(
                  Icon(Icons.headset_mic, color: Colors.white), 'Audio', [
                Color(int.parse('FFF17A02', radix: 16)),
                Color(int.parse('FFF17A02', radix: 16)),
                Color(int.parse('FFF6AD0D', radix: 16)),
                Color(int.parse('FFF6AD0D', radix: 16))
              ]),
              _buildOption(
                Icon(Icons.location_on, color: Colors.white),
                'Location',
                [
                  Color(int.parse('FF108B50', radix: 16)),
                  Color(int.parse('FF108B50', radix: 16)),
                  Color(int.parse('FF039B52', radix: 16)),
                  Color(int.parse('FF039B52', radix: 16))
                ],
              ),
              _buildOption(Icon(Icons.person, color: Colors.white), 'Contact', [
                Color(int.parse('FF0795DD', radix: 16)),
                Color(int.parse('FF0795DD', radix: 16)),
                Color(int.parse('FF0EAAF4', radix: 16)),
                Color(int.parse('FF0EAAF4', radix: 16))
              ])
            ],
          )
        ],
      ),
    );
  }

  Widget _buildOption(Icon icon, String text, List<Color> colors) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: colors,
                        stops: [0.0, 0.5, 0.5, 1.0])),
                child: icon),
            SizedBox(height: 8),
            Text(text,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontSize: 14))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: (){
            
          },
        ),
        title: Row(
          children: <Widget>[
            CircleAvatar(
                radius: 20, backgroundImage: AssetImage('res/assets/images/steven.jpg')),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Text('Niraj',
                style: TextStyle(
                    fontFamily: FontConstants.NUNITOSANS,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.more_horiz, size: 30),
              color: Colors.white,
              itemBuilder: (BuildContext context) {
                if(_overlayEntry != null) {
                  _overlayEntry.remove();
                  _overlayEntry = null;
                }
                return [
                  PopupMenuItem(child: Text("WallPaper")),
                  PopupMenuItem(child: Text("Clear Chats")),
                  PopupMenuItem(child: Text("Others")),
                ];
              }
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage(assetImage), fit: BoxFit.cover)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {

                        return _buildMessage(messages[index], true, true, timeStamp);
                      }),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
