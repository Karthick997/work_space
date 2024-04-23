import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:work_space_project/widget/constant.dart';
import 'package:work_space_project/widget/string.dart';

class ReadMoreScreen extends StatefulWidget {
  const ReadMoreScreen({Key? key}) : super(key: key);

  @override
  State<ReadMoreScreen> createState() => _ReadMoreScreenState();
}

class _ReadMoreScreenState extends State<ReadMoreScreen> {
  final String _text = 'Jeans are usually considered business casual, with '
      'some exceptions Jeans are usually considered '
      'business casual, with '
      'Jeans are usually considered business casual.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: primaryColor,
                fontFamily: MyStrings.poppins),
          ),
          const SizedBox(height: 10),
          ExpandableText(
            readMoreText: "Read More",
            readLessText: "Read Less",
            linkTextStyle:
                TextStyle(fontFamily: MyStrings.poppins, color: primaryColor),
            _text,
            trimType: TrimType.lines,
            trim: 3,
            style: TextStyle(fontFamily: MyStrings.poppins, color: blackColor),
          ),
        ],
      ),
    );
  }
}
