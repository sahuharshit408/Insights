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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.display_settings_sharp),
        ),
        title: const Text('Insights'),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
              },
              icon: const Icon(Icons.bookmark),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
              },
              icon: const Icon(Icons.notifications),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
              },
              icon: const Icon(Icons.person),
            ),
            label: "",
          ),
        ],
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
