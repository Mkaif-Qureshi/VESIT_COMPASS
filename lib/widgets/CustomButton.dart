import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';

import '../screens/EventPage.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        elevation: 5.0,
        color: Colors.blueGrey, // You can customize the color
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EventPage()),
            );
          }, // Placeholder onPressed function
          minWidth: 270.0,
          height: 50.0,
          color: kButtonColor, // Use the same color as in FloorCard
          child: Text(
            buttonText,
            style: kMyTextStyle,
          ),
        ),
      ),
    );
  }
}
