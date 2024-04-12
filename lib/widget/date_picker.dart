import 'package:flutter/material.dart';
import 'package:work_space_project/widget/constant.dart';

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({super.key});

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 0.2,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: _controller,
        // readOnly: true,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xff165a72), // Set the cursor color here
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () => _selectDate(context),
            icon: Icon(
              Icons.calendar_month_outlined,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
