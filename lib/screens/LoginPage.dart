import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../widgets/MyAppBar.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title1: 'Login',
        text1Size: 20.0,
        logoPath: 'assets/images/MainLogo.png',
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                                    } catch (e) {
                    print(e);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Login Error"),
                          content: const Text(
                              "Failed to login. Please check your credentials."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  minimumSize: const Size(100, 40),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                'Not have an account? Register',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
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
