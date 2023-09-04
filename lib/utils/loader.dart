// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color color;
  final int size;
  const Loader({
    Key? key,
    this.color = Colors.white,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.toDouble(),
        width: size.toDouble(),
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
