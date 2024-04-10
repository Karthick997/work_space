import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_space_project/UI_Screen/verification_screen.dart';
import 'package:work_space_project/widget/constant.dart';
import 'package:work_space_project/widget/string.dart';

class LogInScreen extends StatefulWidget {
  static String verify = "";
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController phoneController = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    countryCode.text = "+91";
    _getPhoneNumber();
  }

  Future<void> _getPhoneNumber() async {
    if (kDebugMode) {
      print("user entered phone number ");
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phoneNumber') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/images/login_image.png"),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: MyStrings.poppins,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontFamily: MyStrings.poppins,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 55,
                decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.phone,
                                color: primaryColor, size: 20),
                          ),
                          hintText: "your Phone Number",
                          hintStyle: const TextStyle(
                              fontFamily: MyStrings.poppins, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff285C4F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    // startLoader(); // Moved inside onPressed
                    if (kDebugMode) {
                      print('send OTP${countryCode.text + phone}');
                    }
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countryCode.text + phone,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        LogInScreen.verify = verificationId;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpVerifyScreen(
                              phoneNumber: phoneController.text,
                              countryCode: countryCode.text,
                            ),
                          ),
                        ); // Navigate to OTP screen
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    // stopLoader(); // Moved inside onPressed
                  },
                  child: Text(
                    "Send OTP",
                    style: TextStyle(
                      fontFamily: MyStrings.poppins,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // startLoader() {
  //   LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  // }
  //
  // stopLoader() {
  //   Navigator.of(context).pop();
  // }
}
