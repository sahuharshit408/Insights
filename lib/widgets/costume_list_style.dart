import 'package:flutter/material.dart';

class CustomStyle extends StatelessWidget {
  const CustomStyle({super.key});

  @override
  Widget build(context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          
          Text(
            'Content',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
