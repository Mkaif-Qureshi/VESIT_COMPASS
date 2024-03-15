import 'package:flutter/material.dart';

import '../constants.dart';

class VerticalText extends StatelessWidget {
  final List<String> textList;
  final double fontSize;

  VerticalText({required this.textList, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, // Adjust width as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: textList
            .map((text) => Text(
                  text,
                  style: kCorridorTextStyle,
                ))
            .toList(),
      ),
    );
  }
}
