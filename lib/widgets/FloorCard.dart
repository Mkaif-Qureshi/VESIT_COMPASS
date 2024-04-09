import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';
import 'package:vesit_compass/screens/FifthFloorPage.dart';
import 'package:vesit_compass/screens/SixthFloorPage.dart';

import '../screens/FirstFloorPage.dart';
import '../screens/FourthFloorPage.dart';
import '../screens/GroundFloorPage.dart';
import '../screens/SecondFloorPage.dart';
import '../screens/ThirdFloorPage.dart';

class FloorCard extends StatelessWidget {
  final int floorNumber;

  const FloorCard({super.key, required this.floorNumber});

  String getSuffix(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return "th";
    }
    switch (number % 10) {
      case 0:
        return "";
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

  String getFloorText(int number) {
    if (number == 0) {
      return "Ground floor";
    } else {
      return "Floor $number${getSuffix(number)}";
    }
  }

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
            // Redirect to the floor page based on the floor number
            switch (floorNumber) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GroundFloorPage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstFloorPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondFloorPage()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdFloorPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthFloorPage()),
                );
                break;
              case 5:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FifthFloorPage()),
                );
                break;
              case 6:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SixthFloorPage()),
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
            getFloorText(floorNumber),
            style: kMyTextStyle,
          ),
        ),
      ),
    );
  }
}
