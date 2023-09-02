import 'package:flutter/material.dart';
import 'package:insights/news_card_home.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() {

    return _HomeState();
  }

}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed: () {  }, icon: const Icon(Icons.display_settings_sharp),),
          title: const Text('Insights'),
          elevation: 0,
          backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
          actions: [IconButton(onPressed: () {  }, icon: const Icon(Icons.search),),],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 28,vertical: 14),
          scrollDirection: Axis.vertical,
          children: const [
            HomeCard(),
            SizedBox(
              height: 10,
            ),
            HomeCard(),
            SizedBox(
              height: 10,
            ),
            HomeCard(),
            SizedBox(
              height: 10,
            ),
            HomeCard(),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      );

  }
}