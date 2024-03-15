import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';

import '../screens/FirstFloorPage.dart';
import '../screens/SecondFloorPage.dart';
import '../screens/ThirdFloorPage.dart';

class FloorCard extends StatelessWidget {
  final int floorNumber;

  FloorCard({required this.floorNumber});

  String getSuffix(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return "th";
    }
    switch (number % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        elevation: 5.0,
        color: Colors.blueGrey, // You can customize the color
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: () {
            // Redirect to the floor page based on the floor number
            switch (floorNumber) {
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstFloorPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondFloorPage()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdFloorPage()),
                );
                break;
              // Add cases for other floors as needed
              // default:
              //   // If no specific page for the floor, you can show a generic page or handle it as needed
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             GenericFloorPage(floorNumber: floorNumber)),
              //   );
            }
          },
          minWidth: 270.0,
          height: 50.0,
          color: kButtonColor,
          child: Text(
            'Floor $floorNumber${getSuffix(floorNumber)}',
            style: kMyTextStyle,
          ),
        ),
      ),
    );
  }
}
