import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
              splash: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 90,
                            child: LottieBuilder.asset(
                              "asset/images/Animation - 1713444347797.json",
                            )))
                  ],
                ),
              ),
              nextScreen: const LogInScreen(),
              splashTransition: SplashTransition.rotationTransition,
              backgroundColor: whiteColor));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setState(() {});
  }
}
