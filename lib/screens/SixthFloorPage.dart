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

class SixthFloorPage extends StatefulWidget {
  const SixthFloorPage({Key? key}) : super(key: key);

  @override
  _SixthFloorPageState createState() => _SixthFloorPageState();
}

class _SixthFloorPageState extends State<SixthFloorPage> {
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
        title1: '6th Floor ',
        text1Size: 16,
        title2: "Placement Cell",
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
                      roomNumber: '601',
                      isOccupied: isRoomOccupied('601'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '601'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '602',
                      isOccupied: isRoomOccupied('602'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '602'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '603',
                      isOccupied: isRoomOccupied('603'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '603'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '604',
                      isOccupied: isRoomOccupied('604'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '604'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '605',
                      isOccupied: isRoomOccupied('605'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '605'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '606',
                      isOccupied: isRoomOccupied('606'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '606'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '607',
                      isOccupied: isRoomOccupied('607'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '607'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '608',
                      isOccupied: isRoomOccupied('608'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '608'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '609',
                      isOccupied: isRoomOccupied('609'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '609'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '610',
                      isOccupied: isRoomOccupied('610'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '610'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '611',
                      isOccupied: isRoomOccupied('611'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '611'),
                          ),
                        );
                      },
                    ),
                    RoomButton(
                      roomNumber: '612',
                      isOccupied: isRoomOccupied('612'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RoomPage(roomNumber: '612'),
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
                        roomNumber: '613',
                        isOccupied: isRoomOccupied('613'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '613'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '614',
                        isOccupied: isRoomOccupied('614'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '614'),
                            ),
                          );
                        },
                      ),
                      VerticalExitButton(),
                      RoomButton(
                        roomNumber: '615',
                        isOccupied: isRoomOccupied('615'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '615'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '616',
                        isOccupied: isRoomOccupied('616'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '616'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '617',
                        isOccupied: isRoomOccupied('617'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '617'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '618',
                        isOccupied: isRoomOccupied('618'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '618'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '619',
                        isOccupied: isRoomOccupied('619'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '619'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '620',
                        isOccupied: isRoomOccupied('620'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '620'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '621',
                        isOccupied: isRoomOccupied('621'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '621'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '622',
                        isOccupied: isRoomOccupied('622'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '622'),
                            ),
                          );
                        },
                      ),
                      RoomButton(
                        roomNumber: '623',
                        isOccupied: isRoomOccupied('623'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomPage(roomNumber: '623'),
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
