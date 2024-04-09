import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';
import 'package:vesit_compass/screens/HomePage.dart';
import 'package:vesit_compass/screens/LoginPage.dart';
import 'package:vesit_compass/widgets/MyAppBar.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        // home: SplashScreen(),
        // Define initial route
        initialRoute: '/',
        // Define routes
        routes: {
          '/': (context) => const SplashScreen(),
          // SplashScreen will be the initial route
          '/login': (context) => LoginPage(),
          '/home': (context) => const HomePage(),
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to the next page
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => const HomePage()),
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MyAppBar(
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
            const SizedBox(height: 16.0),
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
                      speed: const Duration(milliseconds: 150)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
