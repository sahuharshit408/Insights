// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CustomTextFieldWidget({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.hintText = "",
    this.prefixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hintText == "Password" ? true : false,
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontVariations: [
          FontVariation(
            'wght',
            400,
          ),
        ],
        color: Colors.white70,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        contentPadding: const EdgeInsets.all(20.0),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        fillColor: LoginPageBG,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.2),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
