import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vesit_compass/constants.dart';

class TimerFooter extends StatefulWidget {
  const TimerFooter({Key? key}) : super(key: key);

  @override
  _TimerFooterState createState() => _TimerFooterState();
}

class _TimerFooterState extends State<TimerFooter> {
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
    return Container(
      color: kButtonColor, // Set your desired background color here
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        '$_formattedDateTime',
        style: kMyTextStyle,
      ),
    );
  }
}
