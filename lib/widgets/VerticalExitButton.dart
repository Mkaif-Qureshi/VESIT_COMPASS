import 'package:flutter/material.dart';

import '../constants.dart';
import 'VerticalText.dart';

class VerticalExitButton extends StatelessWidget {
  const VerticalExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 150, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.deepOrange, // Adjust button color as needed
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalText(
              textList: ['E', 'X', 'I', 'T'],
              textStyle: kExitTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
