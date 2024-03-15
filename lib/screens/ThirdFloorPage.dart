import 'package:flutter/material.dart';

import '../widgets/Corridor.dart';
import '../widgets/RoomButton.dart';
import '../widgets/TimerFooter.dart';
import 'MyAppBar.dart';

class ThirdFloorPage extends StatelessWidget {
  const ThirdFloorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title1: '3rd Floor ',
        text1Size: 16,
        title2: "Computer Department (CMPN)",
        logoPath: 'assets/images/vesit.png',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoomButton(roomNumber: '301', isOccupied: true),
                    RoomButton(roomNumber: '302', isOccupied: true),
                    RoomButton(roomNumber: '303', isOccupied: false),
                    RoomButton(roomNumber: '304', isOccupied: true),
                    RoomButton(roomNumber: '305A', isOccupied: true),
                    RoomButton(roomNumber: '306', isOccupied: false),
                    RoomButton(roomNumber: '307', isOccupied: true),
                    RoomButton(roomNumber: '308', isOccupied: true),
                    RoomButton(roomNumber: '309A', isOccupied: true),
                    RoomButton(roomNumber: '310A', isOccupied: true),
                    RoomButton(roomNumber: '310B', isOccupied: true),
                    // Add more RoomButtons as needed
                  ],
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 100.0),
                    width: 50,
                    child: VerticalText(
                      textList: ['C', 'O', 'R', 'R', 'I', 'D', 'O', 'R'],
                      fontSize: 24, // Adjust font size as needed
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RoomButton(roomNumber: '312', isOccupied: true),
                      RoomButton(roomNumber: '313', isOccupied: true),
                      RoomButton(roomNumber: '314', isOccupied: true),
                      RoomButton(roomNumber: '315', isOccupied: true),
                      // Add more RoomButtons as needed
                    ],
                  ),
                ),
              ],
            ),
            TimerFooter(),
          ],
        ),
      ),
    );
  }
}
