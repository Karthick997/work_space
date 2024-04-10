import 'package:flutter/material.dart';
import 'package:work_space_project/widget/constant.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/string.dart';
import 'package:intl/intl.dart';

import 'createtask_screen.dart';

class TaskList {
  final String title;
  final String status;
  final String name;
  final String priority;
  final String date;

  TaskList({
    required this.title,
    required this.status,
    required this.name,
    required this.priority,
    required this.date,
  });
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<TaskList> taskList = [
    TaskList(
      title: "Mens Combo",
      status: "completed ",
      name: "karthick",
      priority: "low priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "womens Combo",
      status: "In progress ",
      name: "praveen",
      priority: "medium priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "Mens Combo",
      status: "completed ",
      name: "karthick",
      priority: "high priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "womens Combo",
      status: "In progress ",
      name: "karthick",
      priority: "low priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "Mens Combo",
      status: "completed ",
      name: "karthick",
      priority: "low priority ",
      date: "09 may 2023 ",
    ),
  ];
  ScrollController? _scrollController;

  DateTime? _selectedDate;

  final List<int> _selectedIndices = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateOfBirthController = TextEditingController();
    Future<void> selectDate(BuildContext context) async {
      DateTime selectedDate = DateTime.now();
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (picked != null && picked != selectedDate) {
        dateOfBirthController.text = picked.toString();
      }
    }

    _selectedDate ??= DateTime.now();
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("asset/images/Ellipse 42.png"),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: bottomSheetHeight,
                                child: SingleChildScrollView(
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
                            );
                          },
                        );
                      },
                      icon: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF0F0F0),
                        ),
                        child: const Icon(Icons.add,
                            color: Color(0xffA8A8A8), size: 20),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 55,
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      DateTime(_selectedDate!.year, _selectedDate!.month + 1, 0)
                          .day,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime dateTime = DateTime(
                        _selectedDate!.year, _selectedDate!.month, index + 1);
                    String dayName = DateFormat('EEE').format(dateTime);
                    String day = (index + 1).toString();
                    Color color = _selectedIndices.contains(index)
                        ? calenderScColor
                        : Colors.white;
                    Color textColor = _selectedIndices.contains(index)
                        ? primaryColor
                        : primaryColor;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndices.contains(index)) {
                            _selectedIndices.remove(index);
                          } else {
                            _selectedIndices.add(index);
                          }
                        });
                        _scrollToSelectedDate(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 50,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: color,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dayName,
                              style: TextStyle(
                                fontFamily: MyStrings.poppins,
                                fontSize: 12,
                                color: textColor,
                              ),
                            ),
                            Text(
                              day,
                              style: TextStyle(
                                  fontFamily: MyStrings.poppins,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: textColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                        borderRadius: BorderRadius.circular(17),
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
                        borderRadius: BorderRadius.circular(17),
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
                        borderRadius: BorderRadius.circular(17),
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
                      height: 15,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor,
                                blurRadius: 3, // soften the shadow
                                spreadRadius: 0, //extend the shadow
                                offset: const Offset(
                                  0,
                                  0.5,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: whiteColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(
                                      text: taskList[index].title,
                                      fontFamily: MyStrings.poppins,
                                      fontWeight: FontWeight.w600,
                                      size: 16,
                                      color: blackColor),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SmallText(
                                              text: MyStrings.assignTo,
                                              fontFamily: MyStrings.poppins,
                                              fontWeight: FontWeight.w300,
                                              size: 13,
                                              color: Color(0xffA09696)),
                                          SmallText(
                                              text: taskList[index].name,
                                              fontFamily: MyStrings.poppins,
                                              fontWeight: FontWeight.w400,
                                              size: 13,
                                              color: blackColor),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffFFF8F8),
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffEC2013),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Center(
                                              child: SmallText(
                                                text: taskList[index].priority,
                                                fontFamily: MyStrings.poppins,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xffEC2013),
                                                size: 10,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                              width: 10), // Add space here
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: highContainerColor,
                                    ),
                                    child: Center(
                                      child: SmallText(
                                          text: taskList[index].status,
                                          color: blackColor,
                                          size: 10,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: MyStrings.poppins),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 34,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF7F7F7),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.more_time_rounded,
                                            color: blackColor, size: 20),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        SmallText(
                                            text: MyStrings.date,
                                            color: blackColor,
                                            size: 10,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: MyStrings.poppins),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToSelectedDate(int index) {
    double offset = index * 60.0;
    _scrollController!.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
