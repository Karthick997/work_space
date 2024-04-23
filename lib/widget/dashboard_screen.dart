import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:work_space_project/widget/string.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen() : super();

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "DashBoardScreen",
          style: TextStyle(fontFamily: MyStrings.poppins),
        )),
      ),
    );
  }
}
