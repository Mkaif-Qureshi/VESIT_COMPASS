import 'package:flutter/material.dart';
import 'package:vesit_compass/screens/MyAppBar.dart';
import 'package:vesit_compass/widgets/RoomButton.dart';
import 'package:vesit_compass/widgets/TimerFooter.dart';
import 'package:vesit_compass/widgets/VerticalExitButton.dart';
import 'package:vesit_compass/widgets/VerticalText.dart';

import '../constants.dart';
import 'RoomPage.dart';

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
                    RoomButton(
                        roomNumber: '307',
                        isOccupied: true,
                        onTap: () {
                          // Navigate to RoomPage with room number 307
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RoomPage(roomNumber: '307')),
                          );
                        }),
                    RoomButton(roomNumber: '308', isOccupied: true),
                    RoomButton(roomNumber: '309A', isOccupied: true),
                    RoomButton(roomNumber: '310A', isOccupied: true),
                    RoomButton(roomNumber: '310B', isOccupied: true),
                    // Add more RoomButtons as needed
                  ],
                ),
                Center(
                  child: Container(
                    child: VerticalText(
                      textList: ['C', 'O', 'R', 'R', 'I', 'D', 'O', 'R'],
                      textStyle: kCorridorTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RoomButton(roomNumber: '312', isOccupied: true),
                      RoomButton(roomNumber: '313', isOccupied: true),
                      VerticalExitButton(),
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
