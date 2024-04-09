import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../widgets/MyAppBar.dart';

class RoomPage extends StatefulWidget {
  final String roomNumber;

  const RoomPage({super.key, required this.roomNumber});

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late Map<String, dynamic> roomData;

  @override
  void initState() {
    super.initState();
    roomData = {};
    loadRoomData();
  }

  Future<void> loadRoomData() async {
    String jsonString = await rootBundle.loadString('data/room_data.json');
    Map<String, dynamic> data = jsonDecode(jsonString);
    setState(() {
      roomData = data[widget.roomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (roomData.isEmpty) {
      return Scaffold(
        appBar: MyAppBar(
          title1: 'Room ${widget.roomNumber}',
          text1Size: 20.0,
          logoPath: 'assets/images/vesit.png',
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(
        title1: 'Room ${widget.roomNumber}',
        text1Size: 20.0,
        logoPath: 'assets/images/vesit.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name : ${roomData["name"]}',
                        style: kMyTextStyle.copyWith(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        title: const Text('Status:'),
                        subtitle: Text(roomData["status"], style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Incharge:'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (roomData["incharge"] as List)
                              .map<Widget>(
                                  (name) => Text(name, style: kMyTextStyle))
                              .toList(),
                        ),
                      ),
                      ListTile(
                        title: const Text('Batch:'),
                        subtitle: Text(roomData["batch"], style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Subject:'),
                        subtitle:
                            Text(roomData["subject"], style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Time:'),
                        subtitle: Text(roomData["time"], style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Number of Computers:'),
                        subtitle: Text(roomData["computers"].toString(),
                            style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Number of Printers:'),
                        subtitle: Text(roomData["printers"].toString(),
                            style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Printer Status:'),
                        subtitle: Text(roomData["printerStatus"],
                            style: kMyTextStyle),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Specifications:',
                        style: kMyTextStyle.copyWith(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      ListTile(
                        title: const Text('RAM:'),
                        subtitle: Text(roomData["specifications"]["ram"],
                            style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Storage:'),
                        subtitle: Text(roomData["specifications"]["storage"],
                            style: kMyTextStyle),
                      ),
                      ListTile(
                        title: const Text('Operating Systems:'),
                        subtitle: Text(
                            roomData["specifications"]["os"].join(", "),
                            style: kMyTextStyle),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kButtonColor,
        onPressed: () {
          Navigator.pop(context); // Go back when button is pressed
        },
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
