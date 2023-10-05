// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/constants.dart';
import 'package:insights/utils/loader.dart';

class NotificationScreen extends StatelessWidget {
  final Function(int index) changeSelectedScreenIndex;

  const NotificationScreen({
    Key? key,
    required this.changeSelectedScreenIndex,
  }) : super(key: key);

  final prProvider = Provider.of<PrPovider>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontVariations: [FontVariation("wght", 700)],
          ),
        ),
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
      ),
      body: const RocketLoader(),
    );
  }
}
