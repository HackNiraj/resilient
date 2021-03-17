import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resilient/chat_messenger/chat_app.dart';
import 'package:resilient/constants/fonts.dart';
import 'package:resilient/custom_widgets/custom_icons.dart';
import 'package:resilient/donation/donation_buttons.dart';
import 'package:resilient/donation/request_donation.dart';
import 'package:resilient/donation/make_donation.dart';
import 'package:resilient/main_app_screen/home/custom_drawer.dart';
import 'package:resilient/main_app_screen/home/post_composer.dart';
import 'package:resilient/main_app_screen/home/post_screen.dart';
import 'package:resilient/user/user.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

  bool createPost = false;
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        endDrawerEnableOpenDragGesture: false,
        drawer: CustomDrawer(),
        appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(CustomIcons.menu_left_alt, color: Colors.white),
                onPressed: () {
                  if (Scaffold.of(context).hasDrawer)
                    Scaffold.of(context).openDrawer();
                },
              )
            ),
            title: Center(
                child: Text('RESILIENT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: FontConstants.NUNITOSANS,
                        color: Colors.white,
                        letterSpacing: 4))),
            backgroundColor: Color(int.parse("FFB60057", radix: 16)),
            elevation: 0.7,
            automaticallyImplyLeading: false,
            actions: [IconButton(onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChatApplication()
              ));
            },icon: Icon(CustomIcons.message_filled))],
        ),
        floatingActionButton: _bottomNavIndex == 0? FloatingActionButton.extended(
          elevation: 7,
          icon: createPost? Icon(Icons.close, color: Colors.white) : Icon(Icons.auto_fix_high, color: Colors.white),
          label: Text(
            createPost? 'Close':'Compose',
            style: TextStyle(
                color: Colors.white,
                fontFamily: FontConstants.NUNITOSANS,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: () {
            setState(() {
              if(createPost)
                FocusScope.of(context).requestFocus(new FocusNode());
              createPost = !createPost;
            });
          },
          backgroundColor: Color(int.parse("FF0F2D51", radix: 16)),
          ): null,
        bottomNavigationBar: !createPost? BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Donation'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile')
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10.0,
          selectedItemColor: Color(int.parse("FFB60057", radix: 16)),
          unselectedItemColor: Color(int.parse("FFEFE3F7", radix: 16)),
          backgroundColor: Colors.white,
          currentIndex: _bottomNavIndex,
          onTap: (index) => setState(() {
            _bottomNavIndex = index;
          } )
        ): null,
        body: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: ListView.builder(
                    itemCount: posts.length,
                    physics: createPost? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if(index == posts.length-1) {
                        return PostScreen(posts[index].user, posts[index].postTitle,
                            posts[index].imageUrl, posts[index].timeStamp);
                      }
                      return Column(
                        children: [
                          PostScreen(posts[index].user, posts[index].postTitle,
                              posts[index].imageUrl, posts[index].timeStamp),
                          Container(height: 2, margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.025), color: Colors.grey)
                        ],
                      );
                    }),
              ),
              _yourContainer(),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 545),
          reverseDuration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(child: child, position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation));
          },
              child: _bottomNavIndex == 2? showDonationButtons(context, _bottomNavIndex) : SizedBox.shrink()
        )
            ],
          ),
        )
      )
    );
  }

  Widget _yourContainer() {
      return AnimatedSwitcher(
          duration: Duration(milliseconds: 545),
          reverseDuration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(child: child, position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0)).animate(animation));
          },
          child: BackdropFilter(
              key: ValueKey<bool>(createPost),
              filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
              child: createPost? PostComposer() : SizedBox.shrink()
          )
      );
  }
}

Widget showDonationButtons(BuildContext context, int value) {
  return Container(
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContributeToHumans()));
                },
                child: container(context, Color(int.parse('FF991B1E', radix: 16)), "Let's\nContribute")
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetHelpWithHumans()));
                },
                child: container(context, Color(int.parse('FF0F6A31', radix: 16)), "Get\nHelp")
            ),
          ]
        )
  );
}