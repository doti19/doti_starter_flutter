import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: myColors.primary, useMaterial3: true),
      home: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/women.png',
      fit: BoxFit.contain,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
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

    return Column(children: [
      Container(
        color: myColors.backgroundlight,
        margin: EdgeInsets.only(bottom: 3.0),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('mindset_logo.png', 400),
          ),
        ),
      ),
      Expanded(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: myColors.backgroundlight,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          infiniteAutoScroll: true,
          globalHeader: null,
          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                'Already Signed Up? Login',
                style: TextStyle(
                    fontSize: 16.0,
                    color: myColors.primary,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
          pages: [
            PageViewModel(
              title: "Your Competitve Edge:\nInsight.",
              body: "Start Your Journey to Become Your Best",
              image: _buildImage('face_ball.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Connect with other players to improve your game",
              body: '',
              //     "Download the Stockpile app and master the market with our mini-lesson.",
              image: _buildImage('women.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "start you journey to become your best",
              body: '',
              image: _buildImage('racket.png'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () =>
              _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          //rtl: true, // Display as right-to-left
          back: const Icon(Icons.arrow_back),
          skip: const Text('Skip',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: myColors.primary)),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Done',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: myColors.primary)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
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
          dotsContainerDecorator: const ShapeDecoration(
            color: Color.fromARGB(0, 0, 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
          nextStyle: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(myColors.primary),
          ),
          skipStyle: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(myColors.primary),
          ),
        ),
      ),
    ]);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}
