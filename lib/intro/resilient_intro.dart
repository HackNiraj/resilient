import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:resilient/intro/widget.dart';
import 'package:resilient/signin/log_in.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SignInPage(false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        pageViewModel(
            "Fractional shares",
            "Instead of having to buy an entire share, invest any amount you want.",
            'img1',
            null),
        pageViewModel(
            "Learn as you go",
            "Download the Stockpile app and master the market with our mini-lesson.",
            "img2",
            null),
        pageViewModel(
            "Kids and teens",
            "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            'img3',
            null),
        pageViewModel(
            "Another title page",
            "Another beautiful body text for this example on boarding",
            "img2",
            null),
        pageViewModel(
          "Title of last page",
          null,
          "img1",
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: TextStyle(fontSize: 19.0)),
              Icon(Icons.edit),
              Text(" to edit a post", style: TextStyle(fontSize: 19.0)),
            ],
          ),
        )
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
