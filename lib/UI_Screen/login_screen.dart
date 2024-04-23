import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IntlPhoneField(
                          cursorColor: primaryColor,
                          cursorHeight: 20,
                          controller: phoneController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                            FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                          ],
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.phone,
                              color: primaryColor,
                              size: 20,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            counterText: '', // Remove the "0/10" text
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            // You can still listen to changes here if needed
                            if (kDebugMode) {
                              print(phone.completeNumber);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: isLoading ? null : _sendOTP,
                  child: Text(
                    isLoading ? "Sending OTP..." : "Send OTP",
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

  Future<void> _sendOTP() async {
    setState(() {
      isLoading = true;
    });

    String phone = phoneController.text.trim();
    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your phone number',
            style: TextStyle(fontFamily: MyStrings.poppins),
          ),
        ),
      );
      setState(() {
        isLoading = false;
      });
      return; // Exit onPressed function
    }
    if (phone.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid phone number',
              style: TextStyle(fontFamily: MyStrings.poppins)),
        ),
      );
      setState(() {
        isLoading = false;
      });
      return; // Exit onPressed function
    }
    if (phone.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid phone number',
              style: TextStyle(fontFamily: MyStrings.poppins)),
        ),
      );
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (kDebugMode) {
      print('send OTP${countryCode.text + phone}');
    }

    await Future.delayed(const Duration(seconds: 1));

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countryCode.text + phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        LogInScreen.verify = verificationId;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerifyScreen(
              phoneNumber: phoneController.text,
              countryCode: countryCode.text,
            ),
          ),
        );

        // Navigate to OTP screen
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    setState(() {
      isLoading = false;
    });
  }
}
