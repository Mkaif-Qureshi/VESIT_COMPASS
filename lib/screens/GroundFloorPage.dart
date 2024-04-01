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

class GroundFloorPage extends StatefulWidget {
  const GroundFloorPage({Key? key}) : super(key: key);

  @override
  _GroundFloorPageState createState() => _GroundFloorPageState();
}

class _GroundFloorPageState extends State<GroundFloorPage> {
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
        title1: 'Ground Floor ',
        text1Size: 16,
        title2: "Welcome To Vesit 🙏",
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
                      roomNumber: 'G01',
                      isOccupied: isRoomOccupied('G01'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: 'G01'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: 'G02',
                      isOccupied: isRoomOccupied('G02'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: 'G02'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: 'G03',
                      isOccupied: isRoomOccupied('G03'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: 'G03'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: 'G04',
                      isOccupied: isRoomOccupied('G04'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: 'G04'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: 'G05',
                      isOccupied: isRoomOccupied('G05'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: 'G05'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: 'G06',
                      isOccupied: isRoomOccupied('G06'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: 'G06'),
                          ),
                        );
                      },
                    ),
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
                      RoomButton(
                        roomNumber: 'G07',
                        isOccupied: isRoomOccupied('G07'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G07'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'G08',
                        isOccupied: isRoomOccupied('G08'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G08'),
                            ),
                          );
                        },
                      ),
                      VerticalExitButton(),
                      RoomButton(
                        roomNumber: 'G09',
                        isOccupied: isRoomOccupied('G09'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G09'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'G10',
                        isOccupied: isRoomOccupied('G10'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G10'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'G11',
                        isOccupied: isRoomOccupied('G11'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G11'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'G12',
                        isOccupied: isRoomOccupied('G12'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G12'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'G13',
                        isOccupied: isRoomOccupied('G13'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G13'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'G14',
                        isOccupied: isRoomOccupied('G14'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'G14'),
                            ),
                          );
                        },
                      ),
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
