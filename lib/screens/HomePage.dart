import 'package:flutter/material.dart';
import 'package:vesit_compass/screens/MyAppBar.dart';
import 'package:vesit_compass/widgets/FloorCard.dart';
import 'package:vesit_compass/widgets/TimeCard.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
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
              SizedBox(height: 20), // Add some spacing between cards
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
