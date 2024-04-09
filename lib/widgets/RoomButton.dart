import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';

class RoomButton extends StatelessWidget {
  final String roomNumber;
  final bool isOccupied; // true if room is occupied, false otherwise
  final VoidCallback? onTap; // Callback function when button is tapped

  const RoomButton({
    required this.roomNumber,
    required this.isOccupied,
    this.onTap, // Accept onTap as a parameter
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Material(
          elevation: 5.0,
          color: kButtonColor,
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            // Use InkWell for tap functionality
            onTap: onTap, // Call the onTap function when button is tapped
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    roomNumber,
                    style: kMyTextStyle,
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isOccupied ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
