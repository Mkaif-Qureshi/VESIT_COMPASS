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

class FifthFloorPage extends StatefulWidget {
  const FifthFloorPage({Key? key}) : super(key: key);

  @override
  _FifthFloorPageState createState() => _FifthFloorPageState();
}

class _FifthFloorPageState extends State<FifthFloorPage> {
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
        title1: '5th Floor ',
        text1Size: 16,
        title2: "INFT & Humanities",
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
                      roomNumber: '501',
                      isOccupied: isRoomOccupied('501'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '501'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '502',
                      isOccupied: isRoomOccupied('502'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '502'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '503',
                      isOccupied: isRoomOccupied('503'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '503'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '504',
                      isOccupied: isRoomOccupied('504'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '504'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '505',
                      isOccupied: isRoomOccupied('505'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '505'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '506',
                      isOccupied: isRoomOccupied('506'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '506'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '507',
                      isOccupied: isRoomOccupied('507'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '507'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '508',
                      isOccupied: isRoomOccupied('508'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '508'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '509',
                      isOccupied: isRoomOccupied('509'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '509'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '510',
                      isOccupied: isRoomOccupied('510'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '510'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '511',
                      isOccupied: isRoomOccupied('511'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '511'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '512',
                      isOccupied: isRoomOccupied('512'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '512'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '513',
                      isOccupied: isRoomOccupied('513'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RoomPage(roomNumber: '513'),
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
                        roomNumber: '514',
                        isOccupied: isRoomOccupied('514'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '514'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '515',
                        isOccupied: isRoomOccupied('515'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '515'),
                            ),
                          );
                        },
                      ),
                      const VerticalExitButton(),
                      RoomButton(
                        roomNumber: '516',
                        isOccupied: isRoomOccupied('516'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '516'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '517',
                        isOccupied: isRoomOccupied('517'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '517'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '518',
                        isOccupied: isRoomOccupied('518'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '518'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '519',
                        isOccupied: isRoomOccupied('519'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '519'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '520',
                        isOccupied: isRoomOccupied('520'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomPage(roomNumber: '520'),
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
