import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/loader.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(43, 201, 144, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(double.infinity, 60),
        ),
        onPressed: () async {
          if (isLoading) return;
          setState(() {
            isLoading = true;
          });
          await Future.delayed(const Duration(seconds: 1));
          widget.onPressed();
          setState(() {
            isLoading = false;
          });
        },
        child: isLoading
            ? Loader()
            : Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontVariations: [
                    FontVariation(
                      'wght',
                      700,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
