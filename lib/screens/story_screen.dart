import 'package:flutter/material.dart';
import 'package:insights/screens/home.dart';
import 'package:insights/widgets/story_card.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() {
    return _StoryCardState();
  }
}

class _StoryCardState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GOVSNAP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
          ),
          textAlign: TextAlign.justify,
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        child: Column(
          children: [
            StoryCard(),
            Text(
              'Head Line',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'News Description',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
