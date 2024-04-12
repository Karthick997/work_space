import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_space_project/UI_Screen/login_screen.dart';

import '../widget/bottomnavigationbar_screen.dart';
import '../widget/constant.dart';
import '../widget/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      return const BottomNavigationBarScreen();
    } else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
              duration: 800,
              splash: Text(
                "Work Space",
                style: TextStyle(
                  fontFamily: MyStrings.poppins,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
              nextScreen: const LogInScreen(),
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: whiteColor));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setState(() {});
  }
}
