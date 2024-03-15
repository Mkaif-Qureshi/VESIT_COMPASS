import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';

class RoomButton extends StatelessWidget {
  final String roomNumber;
  final bool isOccupied; // true if room is occupied, false otherwise

  const RoomButton({
    required this.roomNumber,
    required this.isOccupied,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Material(
          elevation: 5.0,
          color: kButtonColor,
          borderRadius: BorderRadius.circular(10.0),
          child: MaterialButton(
            onPressed: () {},
            minWidth: 300.0,
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  roomNumber,
                  style: kMyTextStyle,
                ),
                SizedBox(width: 10.0),
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
    );
  }
}
