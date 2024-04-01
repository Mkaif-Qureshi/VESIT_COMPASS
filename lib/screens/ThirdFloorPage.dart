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

class ThirdFloorPage extends StatefulWidget {
  const ThirdFloorPage({Key? key}) : super(key: key);

  @override
  _ThirdFloorPageState createState() => _ThirdFloorPageState();
}

class _ThirdFloorPageState extends State<ThirdFloorPage> {
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
                    RoomButton(
                      roomNumber: '301',
                      isOccupied: isRoomOccupied('301'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '301'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '302',
                      isOccupied: isRoomOccupied('302'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '302'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '303',
                      isOccupied: isRoomOccupied('303'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '303'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '304',
                      isOccupied: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '304'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '305A',
                      isOccupied: isRoomOccupied('305A'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '305A'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '306',
                      isOccupied: isRoomOccupied('306'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '306'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '307',
                      isOccupied: isRoomOccupied('307'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '307'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '308',
                      isOccupied: isRoomOccupied('308'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '308'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '309A',
                      isOccupied: isRoomOccupied('309A'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '309A'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '310A',
                      isOccupied: isRoomOccupied('310A'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '310A'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '310B',
                      isOccupied: isRoomOccupied('310B'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '310B'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '311',
                      isOccupied: isRoomOccupied('311'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '311'),
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
                        roomNumber: '314',
                        isOccupied: isRoomOccupied('314'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '314'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '315',
                        isOccupied: isRoomOccupied('315'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '315'),
                            ),
                          );
                        },
                      ),
                      VerticalExitButton(),
                      RoomButton(
                        roomNumber: '312',
                        isOccupied: isRoomOccupied('312'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '312'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '313',
                        isOccupied: isRoomOccupied('313'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '313'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'B31',
                        isOccupied: isRoomOccupied('B31'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'B31'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'B32',
                        isOccupied: isRoomOccupied('B32'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'B32'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: 'B33',
                        isOccupied: isRoomOccupied('B33'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: 'B33'),
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
