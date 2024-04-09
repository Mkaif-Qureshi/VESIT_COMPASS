import 'package:flutter/material.dart';

import '../constants.dart';

class VerticalText extends StatelessWidget {
  final List<String> textList;
  final TextStyle textStyle;

  const VerticalText({super.key, required this.textList, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: textList
            .map((text) => Text(
                  text,
                  style: textStyle ?? kCorridorTextStyle,
                ))
            .toList(),
      ),
    );
  }
}
