import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vesit_compass/constants.dart';

class TimeCard extends StatefulWidget {
  final Color color;

  const TimeCard({super.key, required this.color});

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  late String formattedDateTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the time when the widget is created
    updateTime();
    // Schedule periodic timer to update the time every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    setState(() {
      formattedDateTime =
          DateFormat(" dd-MM-yyyy  |  hh:mm a ").format(DateTime.now());
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        elevation: 5.0,
        color: kButtonColor,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: () {},
          minWidth: 300.0,
          height: 45.0,
          child: Text(
            formattedDateTime,
            style: kMyTextStyle,
          ),
        ),
      ),
    );
  }
}
