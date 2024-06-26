import 'package:flutter/material.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/string.dart';
import '../constant.dart';
import '../date_picker.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SmallText(
          text: MyStrings.taskTitle,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 0.2,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: const Color(0xff165a72), // Set the cursor color here
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SmallText(
          text: MyStrings.priorityLevel,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 99,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(
                  child: SmallText(
                text: MyStrings.low,
                fontFamily: MyStrings.poppins,
                size: 13,
                fontWeight: FontWeight.w400,
              )),
            ),
            Container(
              height: 40,
              width: 99,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(
                  child: SmallText(
                text: MyStrings.medium,
                fontFamily: MyStrings.poppins,
                size: 13,
                fontWeight: FontWeight.w400,
              )),
            ),
            Container(
              height: 40,
              width: 99,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(
                  child: SmallText(
                text: MyStrings.high,
                fontFamily: MyStrings.poppins,
                size: 13,
                fontWeight: FontWeight.w400,
              )),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const SmallText(
          text: MyStrings.dueDate,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        const DatePickerTextField(),
        const SizedBox(
          height: 10,
        ),
        const SmallText(
          text: MyStrings.organization,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 0.2,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: const Color(0xff165a72), // Set the cursor color here
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: primaryColor,
                size: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SmallText(
          text: MyStrings.assignedTo,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 0.2,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: const Color(0xff165a72), // Set the cursor color here
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SmallText(
          text: MyStrings.image,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 10),
        // ImageUploadScreen(),
        const SizedBox(
          height: 10,
        ),
        const SmallText(
          text: MyStrings.description,
          color: Color(0xffACACAC),
          fontFamily: MyStrings.poppins,
          size: 13,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 0.2,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: const Color(0xff165a72), // Set the cursor color here
            decoration: InputDecoration(
              fillColor: Colors.grey[300],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: primaryColor),
            child: Center(
              child: SmallText(
                  text: MyStrings.createTask,
                  color: whiteColor,
                  size: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: MyStrings.poppins),
            ),
          ),
        )
      ],
    );
  }
}
