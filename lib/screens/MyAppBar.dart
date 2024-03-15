import 'package:flutter/material.dart';
import 'package:vesit_compass/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String? title2;
  final double text1Size;
  final String logoPath;
  const MyAppBar({
    super.key,
    required this.title1,
    required this.text1Size,
    required this.logoPath,
    this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image(
            image: AssetImage(logoPath),
            fit: BoxFit.fill,
            width: 50,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyle(
                  fontSize: 16,
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (title2 != null) // Conditionally render title2 if not null
                Text(
                  title2!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
            ],
          ),
        ],
      ),
      backgroundColor: kBackgroundColor, // Set your desired color here
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
