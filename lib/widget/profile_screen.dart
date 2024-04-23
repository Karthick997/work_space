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
      // Show a basic loader
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        },
      );

      await FirebaseAuth.instance.signOut();
      // Delay for 2 seconds
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pop(context); // Close the loader dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Successfully Logout',
            style: TextStyle(fontFamily: MyStrings.poppins),
          ),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
      );
    } catch (e) {
      Navigator.pop(context); // Close the loader dialog
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
      body: Center(
        child: Text(
          "profile",
          style: TextStyle(
            fontFamily: MyStrings.poppins,
            color: primaryColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
