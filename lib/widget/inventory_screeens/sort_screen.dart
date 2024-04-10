import 'package:flutter/material.dart';
import 'package:work_space_project/widget/small_text.dart';
import 'package:work_space_project/widget/string.dart';
import '../constant.dart';

class SortScreen extends StatefulWidget {
  const SortScreen({Key? key}) : super(key: key);

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  int _value = 1;
  List<String> radioTexts = [
    'Recently added',
    'This week',
    'Select the month',
    'Favourite'
  ];
  List<IconData> icons = [
    Icons.more_time_rounded,
    Icons.calendar_month_outlined,
    Icons.calendar_month_outlined,
    Icons.favorite_border_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(
          text: MyStrings.sortBy,
          color: primaryColor,
          fontFamily: MyStrings.poppins,
          fontWeight: FontWeight.w700,
          size: 13,
        ),
        Column(
          children: <Widget>[
            for (int i = 1; i <= 4; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                title: GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = i;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        Icon(
                          icons[i -
                              1], // Access the icon from the list based on the index
                          color: blackColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          radioTexts[i -
                              1], // Access the text from the list based on the index
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    fontFamily: MyStrings.poppins,
                                    color: i == 4 ? blackColor : blackColor,
                                  ),
                        ),
                        const Spacer(),
                        Radio(
                          value: i,
                          groupValue: _value,
                          onChanged: (int? value) {
                            setState(() {
                              _value = value!;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
