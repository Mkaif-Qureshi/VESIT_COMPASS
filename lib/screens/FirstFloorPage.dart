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

class FirstFloorPage extends StatefulWidget {
  const FirstFloorPage({Key? key}) : super(key: key);

  @override
  _FirstFloorPageState createState() => _FirstFloorPageState();
}

class _FirstFloorPageState extends State<FirstFloorPage> {
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
        title1: '1st Floor ',
        text1Size: 16,
        title2: "AURO",
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
                      roomNumber: '101',
                      isOccupied: isRoomOccupied('101'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '101'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '102',
                      isOccupied: isRoomOccupied('102'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '102'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '103',
                      isOccupied: isRoomOccupied('103'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '103'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '104',
                      isOccupied: isRoomOccupied('104'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '104'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '105',
                      isOccupied: isRoomOccupied('105'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '105'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '106',
                      isOccupied: isRoomOccupied('106'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '106'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '107',
                      isOccupied: isRoomOccupied('107'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '107'),
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
                        roomNumber: '108',
                        isOccupied: isRoomOccupied('108'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '108'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '109',
                        isOccupied: isRoomOccupied('109'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '109'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '110',
                        isOccupied: isRoomOccupied('110'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '110'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '111',
                        isOccupied: isRoomOccupied('111'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '111'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '112',
                        isOccupied: isRoomOccupied('112'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '112'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '113',
                        isOccupied: isRoomOccupied('113'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '113'),
                            ),
                          );
                        },
                      ),
                      VerticalExitButton(),
                      RoomButton(
                        roomNumber: '114',
                        isOccupied: isRoomOccupied('114'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '114'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '115',
                        isOccupied: isRoomOccupied('115'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '115'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '116',
                        isOccupied: isRoomOccupied('116'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '116'),
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
