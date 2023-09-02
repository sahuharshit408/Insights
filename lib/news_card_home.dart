import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build( context) {
    return   SizedBox(
      height: 342,
      width: 342,
      child: InkWell(
        onTap: () {

        },
        child: const Card(
          elevation: 15,
          color: Colors.green,
          clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))
            ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Head Line'),
              Text('News Short Description')
            ],
          ),
        ),
      ),
    );
  }

}