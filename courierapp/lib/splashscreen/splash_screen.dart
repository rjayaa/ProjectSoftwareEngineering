import 'dart:async';

import 'package:flutter/material.dart';

import '../authentication/auth_screen.dart';
import '../global/global.dart';
import '../mainScreens/home_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 1), () async {
      if (firebaseAuth.currentUser != null) {
        // kalo courier udah login langsung direct ke homescreen
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      } // kalo courier belom login, harus ke authscreen terlebih dahulu
      else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff1E1E1E),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "images/WhiteccsIcon.png",
              height: 300,
              width: 300,
            ),
            const Positioned(
              bottom: 50,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Courier's App!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 40,
                    fontFamily: "Signatra",
                    letterSpacing: 3,
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
