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

class FourthFloorPage extends StatefulWidget {
  const FourthFloorPage({Key? key}) : super(key: key);

  @override
  _FourthFloorPageState createState() => _FourthFloorPageState();
}

class _FourthFloorPageState extends State<FourthFloorPage> {
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
            title: const Text("Error"),
            content: const Text("Failed to load timetable data."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
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
          title: const Text('Loading...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: const MyAppBar(
        title1: '4th Floor ',
        text1Size: 16,
        title2: "EXTC",
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
                      roomNumber: '401',
                      isOccupied: isRoomOccupied('401'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '401'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '402',
                      isOccupied: isRoomOccupied('402'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '402'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '403',
                      isOccupied: isRoomOccupied('403'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '403'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '404',
                      isOccupied: isRoomOccupied('404'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '404'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '405',
                      isOccupied: isRoomOccupied('405'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '405'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '406',
                      isOccupied: isRoomOccupied('406'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '406'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '407',
                      isOccupied: isRoomOccupied('407'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '407'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '408',
                      isOccupied: isRoomOccupied('408'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '408'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '409',
                      isOccupied: isRoomOccupied('409'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '409'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '410',
                      isOccupied: isRoomOccupied('410'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '410'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '411',
                      isOccupied: isRoomOccupied('411'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '411'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '412',
                      isOccupied: isRoomOccupied('412'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '412'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    child: const VerticalText(
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
                        roomNumber: '413',
                        isOccupied: isRoomOccupied('413'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '413'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '414',
                        isOccupied: isRoomOccupied('414'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '414'),
                            ),
                          );
                        },
                      ),
                      const VerticalExitButton(),
                      RoomButton(
                        roomNumber: '415',
                        isOccupied: isRoomOccupied('415'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '415'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '416',
                        isOccupied: isRoomOccupied('416'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '416'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '417',
                        isOccupied: isRoomOccupied('417'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '417'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '418',
                        isOccupied: isRoomOccupied('418'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '418'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '419',
                        isOccupied: isRoomOccupied('419'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '419'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '420',
                        isOccupied: isRoomOccupied('420'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '420'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const TimerFooter(),
          ],
        ),
      ),
    );
  }
}
