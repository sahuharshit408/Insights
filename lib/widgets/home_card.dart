import 'package:flutter/material.dart';
import 'package:insights/screens/story_screen.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build( context) {
    return   SizedBox(
      height: 342,
      width: 342,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StoryScreen(),),);
        },
        child: Card(
          elevation: 15,
          clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))
            ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network('https://picsum.photos/250?image=9').image,
                fit: BoxFit.cover
              )
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Head Line'),
                Text('News Short Description')
              ],
            ),
          ),
        ),
      ),
    );
  }

}