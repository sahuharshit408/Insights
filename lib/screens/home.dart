import 'package:flutter/material.dart';
import 'package:insights/widgets/home_card.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical :8.0),
        child: HomeCard(),
      ),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }
}