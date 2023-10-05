import 'dart:ui';

import 'package:flutter/material.dart';

class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({super.key});

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.fromMillisecondsSinceEpoch(1693765800000),
      firstDate: DateTime.fromMillisecondsSinceEpoch(1693765800000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontVariations: [
            FontVariation("wght", 500),
          ],
        ),
        controller: dateController,
        decoration: InputDecoration(
          labelText: "Select Date",
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontVariations: [
              FontVariation("wght", 500),
            ],
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
