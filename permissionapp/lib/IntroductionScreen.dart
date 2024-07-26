import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permissionapp/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyHomePage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/img/cuate.png',
      fit: BoxFit.cover,
      // height: double.infinity,
      width: 300,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
     // allowImplicitScrolling: true,
      //autoScrollDuration: 3000,
      //infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
          //  child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('img/cuate.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
          "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('img/cuate.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
          "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('img/cuate.png'),
          decoration: pageDecoration,

        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: GestureDetector(
          onTap: (){
            _onIntroEnd(context);
          },
          child: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(bottom: 66),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
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


// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:permissionapp/LoginPage.dart';
//
// import 'MyHomePage.dart';
//
// class Introductionscreen extends StatefulWidget {
//   @override
//   _IntroductionscreenState createState() => _IntroductionscreenState();
// }
//
// class _IntroductionscreenState extends State<Introductionscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       pages: [
//         PageViewModel(
//           title: "Welcome",
//           body: "This is the first page of the introduction screen.",
//           // image: Center(child: Image.asset("assets/images/first.png", height: 175.0)),
//           decoration: PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
//             bodyTextStyle: TextStyle(fontSize: 19.0),
//           ),
//         ),
//         PageViewModel(
//           title: "Discover",
//           body: "Discover amazing features of our app.",
//           // image: Center(child: Image.asset("assets/images/second.png", height: 175.0)),
//           decoration: PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
//             bodyTextStyle: TextStyle(fontSize: 19.0),
//           ),
//         ),
//         PageViewModel(
//           title: "Get Started",
//           body: "Get started with our app and enjoy the experience.",
//           // image: Center(child: Image.asset("assets/images/third.png", height: 175.0)),
//           decoration: PageDecoration(
//             titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
//             bodyTextStyle: TextStyle(fontSize: 19.0),
//           ),
//         ),
//       ],
//       onDone: () {
//         // When done button is pressed
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => LoginPage()),
//         );
//       },
//       onSkip: () {
//         // You can also override onSkip callback
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => LoginPage()),
//         );
//       },
//       showSkipButton: true,
//       skip: const Text("Skip"),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
//       dotsDecorator: DotsDecorator(
//         size: Size.square(10.0),
//         activeSize: Size(22.0, 10.0),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25.0),
//         ),
//       ),
//     );
//   }
// }