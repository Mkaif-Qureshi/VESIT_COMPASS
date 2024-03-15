import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'MyAppBar.dart';

class SecondFloorPage extends StatefulWidget {
  const SecondFloorPage({Key? key}) : super(key: key);

  @override
  _SecondFloorPageState createState() => _SecondFloorPageState();
}

class _SecondFloorPageState extends State<SecondFloorPage> {
  late String _formattedDateTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the time when the widget is created
    _updateTime();
    // Schedule periodic timer to update the time every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _formattedDateTime =
          DateFormat("dd-MM-yyyy | hh:mm:ss").format(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title1: '2nd Floor ',
        text1Size: 16,
        title2: "Dept. of AI&DS | MCA",
        logoPath: 'assets/images/vesit.png',
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Welcome to the Second Floor!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            color: Colors.blueGrey, // Set your desired background color here
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              '$_formattedDateTime',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
