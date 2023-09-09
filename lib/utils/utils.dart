import 'dart:ui';

import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(
            color: Colors.white, fontVariations: [FontVariation("wght", 600)]),
      ),
    ),
  );
}
