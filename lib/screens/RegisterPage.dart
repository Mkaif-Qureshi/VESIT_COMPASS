import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:vesit_compass/screens/HomePage.dart';

import '../constants.dart';
import '../widgets/MyAppBar.dart';

class RegisterPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  // List of classes
  final List<String> classes = ['D7A', 'D7B', 'D7C', 'D12A', 'D12B', 'D12C'];
  late String name;
  String? selectedClass; // Change the type to nullable
  late int roll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title1: 'Register', // Title for the app bar
        text1Size: 20.0, // Font size for the title
        logoPath: 'assets/images/MainLogo.png', // Path to your logo asset
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            // SizedBox(height: 20.0),
            // TextFormField(
            //   onChanged: (value) {
            //     name = value;
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Name',
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // // Dropdown list for class selection
            // DropdownButtonFormField(
            //   value: selectedClass,
            //   items: classes.map((String className) {
            //     return DropdownMenuItem<String>(
            //       value: className,
            //       child: Text(className),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     // Update selected class when changed
            //     selectedClass = value as String?;
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Class',
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // TextFormField(
            //   onChanged: (value) {
            //     roll = int.tryParse(value)!;
            //   },
            //   decoration: InputDecoration(
            //     labelText: 'Roll Number',
            //   ),
            //   keyboardType: TextInputType.number, // Set input type to number
            //   inputFormatters: <TextInputFormatter>[
            //     FilteringTextInputFormatter.digitsOnly // Allow only digits
            //   ],
            // ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () async {
                  // Add your registration logic here
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage()), // Navigate to RegisterPage
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  backgroundColor: kButtonColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0), // Button padding
                  // shape: RoundedRectangleBorder(
                  //   borderRadius:
                  //       BorderRadius.circular(8.0), // Button border radius
                  //   // Set minimum width
                  // ),
                ),
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    // Use Google Fonts for a modern look
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           LoginPage()), // Navigate to RegisterPage
                // );

                Navigator.pop(context);
              },
              child: Text(
                'Already have an account? Login',
                style: GoogleFonts.poppins(
                  // Use Google Fonts for a modern look
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
