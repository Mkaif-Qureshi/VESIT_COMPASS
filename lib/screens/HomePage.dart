import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import package for date and time formatting
import 'package:vesit_compass/widgets/FloorCard.dart';
import 'package:vesit_compass/widgets/MyAppBar.dart';
import 'package:vesit_compass/widgets/TimeCard.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String _currentTime;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _getCurrentTime(); // Initialize current time
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        setState(() {
          loggedInUser = user;
          print(loggedInUser.email);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _getCurrentTime() {
    // Get the current date and time
    DateTime now = DateTime.now();
    // Format the time as HH:mm
    _currentTime = DateFormat('HH:mm').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: MyAppBar(
        title1: 'VESIT COMPASS',
        title2: null,
        text1Size: 28,
        logoPath: 'assets/images/MainLogo.png',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimeCard(color: kButtonColor),
              SizedBox(height: 20),
              FloorCard(floorNumber: 0),
              FloorCard(floorNumber: 1),
              FloorCard(floorNumber: 2),
              FloorCard(floorNumber: 3),
              FloorCard(floorNumber: 4),
              FloorCard(floorNumber: 5),
              FloorCard(floorNumber: 6),
              SizedBox(height: 20), // Add some spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
