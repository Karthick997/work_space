import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_space_project/widget/constant.dart';
import 'package:work_space_project/widget/string.dart';
import 'package:work_space_project/UI_Screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Successfully Logout',
          style: TextStyle(fontFamily: MyStrings.poppins),
        )),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error signing out: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Disable automatic back button
        title: Text(
          "profile",
          style: TextStyle(
            fontFamily: MyStrings.poppins,
            color: primaryColor,
            fontSize: 18,
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.logout_outlined),
              color: primaryColor,
              iconSize: 25,
              onPressed: () => _signOut(context),
            ),
          ),
        ],
      ),
    );
  }
}
