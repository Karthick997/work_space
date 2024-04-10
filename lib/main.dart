import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:work_space_project/widget/bottomnavigationbar_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      initialRoute: 'phone',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarScreen(),
      // routes: {
      //   'phone': (context) => MyPhone(),
      //   'verify': (context) => MyVerify(),
      //   'home': (context) => HomeScreen(),
      // },
    ));
  }
}
