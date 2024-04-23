import 'package:flutter/material.dart';
import 'package:work_space_project/widget/constant.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/string.dart';
import 'package:work_space_project/widget/task_screens/tasklist_screen.dart';
import 'calender_screen.dart';
import 'create_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "asset/images/Ellipse 42.png",
                      height: 40,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            SmallText(
                                text: MyStrings.task,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w600,
                                size: 16,
                                color: whiteColor),
                            SmallText(
                                text: MyStrings.assignedToYou,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w300,
                                size: 13,
                                color: whiteColor),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        double screenHeight =
                            MediaQuery.of(context).size.height;
                        double bottomSheetHeight = screenHeight * 0.75;
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: bottomSheetHeight,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                            text: MyStrings.createNewTask,
                                            color: primaryColor,
                                            size: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: MyStrings.poppins),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const CreateTaskScreen(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF0F0F0),
                        ),
                        child: const Icon(Icons.add,
                            color: Color(0xffA8A8A8), size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const CalenderScreen(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(
                      text: MyStrings.priorityLevel,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyStrings.poppins,
                      color: whiteColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SmallText(
                                text: MyStrings.low,
                                color: blackColor,
                                size: 10,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: lowContainerColor,
                              ),
                              child: Center(
                                  child: Text("4",
                                      style: TextStyle(
                                          fontFamily: MyStrings.poppins,
                                          color: blackColor,
                                          fontSize: 10))),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SmallText(
                                text: MyStrings.medium,
                                color: blackColor,
                                size: 10,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: mediumContainerColor,
                              ),
                              child: Center(
                                  child: Text("3",
                                      style: TextStyle(
                                          fontFamily: MyStrings.poppins,
                                          color: blackColor,
                                          fontSize: 10))),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SmallText(
                                text: MyStrings.high,
                                color: blackColor,
                                size: 10,
                                fontFamily: MyStrings.poppins,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: highContainerColor,
                              ),
                              child: Center(
                                  child: Text("7",
                                      style: TextStyle(
                                          fontFamily: MyStrings.poppins,
                                          color: blackColor,
                                          fontSize: 10))),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const TaskListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
