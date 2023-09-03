import 'package:flutter/material.dart';
import 'package:insights/widgets/home_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
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
      body: ListView.builder(
        itemBuilder: (context, index) => const HomeCard(),
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
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
    );
  }
}
