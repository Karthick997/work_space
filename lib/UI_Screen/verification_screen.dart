import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_space_project/UI_Screen/login_screen.dart';
import 'package:work_space_project/widget/constant.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/string.dart';
import '../widget/bottomnavigationbar_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;
  const OtpVerifyScreen(
      {Key? key, required this.phoneNumber, required this.countryCode})
      : super(key: key);

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController passwordController = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Timer _timer;
  int _start = 30;
  var code = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
    _getPhoneNumber();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> resendOtp(String phone, String countryCode) async {
    if (phone.isNotEmpty) {
      if (kDebugMode) {
        print('hello${countryCode + phone}');
      }
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode + phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          LogInScreen.verify = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('phoneNumber', phone);
      _start = 30;
      _startTimer();
    } else {
      if (kDebugMode) {
        print('Phone number is empty');
      }
    }
  }

  Future<void> _getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phoneNumber') ?? "";
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: MyStrings.poppins),
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
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmallText(
                        text: MyStrings.ifYouDidTNotRecevicedACode,
                        fontFamily: MyStrings.poppins,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        size: 13,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      _start == 0
                          ? GestureDetector(
                              onTap: () {
                                resendOtp(
                                    widget.phoneNumber, widget.countryCode);
                              },
                              child: const SmallText(
                                text: 'Resend',
                                fontFamily: MyStrings.poppins,
                                color: Color(0xffFFA800),
                                fontWeight: FontWeight.w500,
                                size: 13,
                              ),
                            )
                          : Text(" time : 00:$_start ",
                              style: const TextStyle(
                                fontFamily: MyStrings.poppins,
                                color: Color(0xffFFA800),
                              ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SmallText(
                  text: MyStrings.backToLogin,
                  fontFamily: MyStrings.poppins,
                  fontWeight: FontWeight.w500,
                  size: 13,
                  color: primaryColor),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff285C4F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: LogInScreen.verify,
                        smsCode: code,
                      );
                      await auth.signInWithCredential(credential);
                      if (mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarScreen()),
                          ModalRoute.withName('home'),
                        );
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print("wrong otp");
                      }
                    }
                  },
                  child: Text("Verify Phone Number",
                      style: TextStyle(
                          fontFamily: MyStrings.poppins,
                          fontSize: 14,
                          color: whiteColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
