import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/TimerFooter.dart';
import 'MyAppBar.dart';

class FirstFloorPage extends StatefulWidget {
  const FirstFloorPage({Key? key}) : super(key: key);

  @override
  _FirstFloorPageState createState() => _FirstFloorPageState();
}

class _FirstFloorPageState extends State<FirstFloorPage> {
  late String _formattedDateTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
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
        title1: 'First Floor',
        text1Size: 16,
        title2: "Automation and Robotics Department (AURO)",
        logoPath: 'assets/images/vesit.png',
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Welcome to the First Floor!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          TimerFooter(),
        ],
      ),
    );
  }
}
