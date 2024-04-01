import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vesit_compass/widgets/MyAppBar.dart';
import 'package:vesit_compass/widgets/RoomButton.dart';
import 'package:vesit_compass/widgets/TimerFooter.dart';
import 'package:vesit_compass/widgets/VerticalExitButton.dart';
import 'package:vesit_compass/widgets/VerticalText.dart';

import '../constants.dart';
import 'RoomPage.dart';

class SecondFloorPage extends StatefulWidget {
  const SecondFloorPage({Key? key}) : super(key: key);

  @override
  _SecondFloorPageState createState() => _SecondFloorPageState();
}

class _SecondFloorPageState extends State<SecondFloorPage> {
  Map<String, dynamic>? timetable;

  @override
  void initState() {
    super.initState();
    _loadTimetable();
  }

  Future<void> _loadTimetable() async {
    try {
      String timetableData = await DefaultAssetBundle.of(context)
          .loadString('/data/TimeTable.json');
      setState(() {
        timetable = jsonDecode(timetableData);
      });
    } catch (e) {
      print('Error loading timetable: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to load timetable data."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  bool isRoomOccupied(String roomNumber) {
    DateTime now = DateTime.now();
    String currentDay = DateFormat('EEEE').format(now).toLowerCase();
    String currentTime = DateFormat('H:mm').format(now);

    if (timetable != null && timetable!.containsKey(currentDay)) {
      Map<String, dynamic> dayTimetable = timetable![currentDay];
      for (var slot in dayTimetable.keys) {
        List<String> timeRange = slot.split('-');
        if (timeRange.length == 2) {
          if (currentTime.compareTo(timeRange[0]) >= 0 &&
              currentTime.compareTo(timeRange[1]) < 0) {
            List<dynamic> classes = dayTimetable[slot];
            for (var className in classes) {
              if (className is String && className.contains(roomNumber)) {
                return true;
              }
            }
          }
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (timetable == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(
        title1: '2nd Floor ',
        text1Size: 16,
        title2: "AI&DS",
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
                    RoomButton(
                        roomNumber: '201', isOccupied: isRoomOccupied('201')),
                    RoomButton(
                        roomNumber: '202', isOccupied: isRoomOccupied('202')),
                    RoomButton(
                        roomNumber: '203', isOccupied: isRoomOccupied('203')),
                    RoomButton(
                        roomNumber: '204', isOccupied: isRoomOccupied('204')),
                    RoomButton(
                        roomNumber: '205A', isOccupied: isRoomOccupied('205A')),
                    RoomButton(
                        roomNumber: '206', isOccupied: isRoomOccupied('206')),
                    RoomButton(
                      roomNumber: '207',
                      isOccupied: isRoomOccupied('207'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '207'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                        roomNumber: '208', isOccupied: isRoomOccupied('208')),
                    RoomButton(
                        roomNumber: '209A', isOccupied: isRoomOccupied('209A')),
                    RoomButton(
                        roomNumber: '210A', isOccupied: isRoomOccupied('210A')),
                    RoomButton(
                        roomNumber: '210B', isOccupied: isRoomOccupied('210B')),
                  ],
                ),
                Center(
                  child: Container(
                    child: Center(
                      child: VerticalText(
                        textList: ['C', 'O', 'R', 'R', 'I', 'D', 'O', 'R'],
                        textStyle: kCorridorTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RoomButton(
                          roomNumber: '212', isOccupied: isRoomOccupied('212')),
                      RoomButton(
                          roomNumber: '213', isOccupied: isRoomOccupied('213')),
                      VerticalExitButton(),
                      RoomButton(
                          roomNumber: '214', isOccupied: isRoomOccupied('214')),
                      RoomButton(
                          roomNumber: '215', isOccupied: isRoomOccupied('215')),
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
