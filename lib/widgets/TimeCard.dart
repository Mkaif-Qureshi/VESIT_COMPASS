import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vesit_compass/constants.dart';

class TimeCard extends StatefulWidget {
  final Color color;

  TimeCard({required this.color});

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  late String formattedDateTime;

  @override
  void initState() {
    super.initState();
    // Initialize the time when the widget is created
    updateTime();
    // Schedule periodic timer to update the time every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    setState(() {
      formattedDateTime =
          DateFormat(" dd-MM-yyyy  |  hh:mm:ss ").format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
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
