import 'package:flutter/material.dart';

import '../constant.dart';
import '../small_text.dart';
import '../string.dart';

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

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<TaskList> taskList = [
    TaskList(
      title: "Mens Combo",
      status: "Completed ",
      name: "karthick",
      priority: "Low priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "womens Combo",
      status: "In progress ",
      name: "praveen",
      priority: "Medium priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "Mens Combo",
      status: "Completed ",
      name: "karthick",
      priority: "High priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "womens Combo",
      status: "In progress ",
      name: "karthick",
      priority: "Low priority ",
      date: "09 may 2023 ",
    ),
    TaskList(
      title: "Mens Combo",
      status: "Completed ",
      name: "karthick",
      priority: "Low priority ",
      date: "09 may 2023 ",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 0.5, //extend the shadow
                              offset: const Offset(
                                0.5, // Move to right 5  horizontally
                                0.5, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                        text: taskList[index].title,
                                        fontFamily: MyStrings.poppins,
                                        fontWeight: FontWeight.w600,
                                        size: 16,
                                        color: primaryColor),
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
                                                size: 10,
                                                color: Color(0xffA09696)),
                                            SmallText(
                                                text: taskList[index].name,
                                                fontFamily: MyStrings.poppins,
                                                fontWeight: FontWeight.w400,
                                                size: 10,
                                                color: Color(0xffA09696)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 25,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: taskList[index]
                                                        .priority
                                                        .toLowerCase()
                                                        .contains("low")
                                                    ? lowContainerColor // Lite red
                                                    : taskList[index]
                                                            .priority
                                                            .toLowerCase()
                                                            .contains("medium")
                                                        ? mediumContainerColor // Lite yellow
                                                        : taskList[index]
                                                                .priority
                                                                .toLowerCase()
                                                                .contains("high")
                                                            ? highContainerColor // Lite green
                                                            : Colors
                                                                .white, // Default color
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons
                                                      .priority_high, // Use the icon you prefer here
                                                  color: taskList[index]
                                                          .priority
                                                          .toLowerCase()
                                                          .contains("low")
                                                      ? whiteColor // Red icon color
                                                      : taskList[index]
                                                              .priority
                                                              .toLowerCase()
                                                              .contains("medium")
                                                          ? whiteColor // Yellow icon color
                                                          : taskList[index]
                                                                  .priority
                                                                  .toLowerCase()
                                                                  .contains(
                                                                      "high")
                                                              ? whiteColor // Green icon color
                                                              : Colors
                                                                  .black, // Default icon color
                                                  size:
                                                      18, // Adjust the size of the icon as needed
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: taskList[index]
                                                  .status
                                                  .toLowerCase()
                                                  .contains("completed")
                                              ? const Color(
                                                  0xffCCEED1) // Green for completed
                                              : taskList[index]
                                                      .status
                                                      .toLowerCase()
                                                      .contains("in progress")
                                                  ? const Color(
                                                      0xffBFE4FF) // Blue for in progress
                                                  : Colors.white, // Default color
                                        ),
                                        child: Center(
                                          child: SmallText(
                                            text: taskList[index].status,
                                            color: Colors
                                                .black, // Black text color for all statuses
                                            size: 10,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: MyStrings.poppins,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                          height:
                                              25), // Add some space between the two containers
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF7F7F7),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.date_range_rounded,
                                                color: primaryColor, size: 20),
                                            const SizedBox(width: 3),
                                            SmallText(
                                              text: MyStrings.date,
                                              color: primaryColor,
                                              size: 10,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: MyStrings.poppins,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
