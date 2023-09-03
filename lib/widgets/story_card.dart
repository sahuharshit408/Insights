//when user click on home card it will navigate to story screen
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 342,
      width: 342,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network('https://picsum.photos/250?image=9').image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
