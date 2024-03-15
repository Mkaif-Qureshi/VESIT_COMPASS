import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';
import 'package:vesit_compass/screens/HomePage.dart';
import 'package:vesit_compass/screens/MyAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to the next page
    Future.delayed(Duration(seconds: 0), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: MyAppBar(
        title1: 'Vivekanand Education Society\'s',
        title2: 'Institute of Technology',
        text1Size: 16,
        logoPath: 'assets/images/vesit.png',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/MainLogo.png', // replace with your logo image path
              width: 300.0,
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
                child:
                    AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
                  TyperAnimatedText('VESIT COMPASS',
                      speed: Duration(milliseconds: 100)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
