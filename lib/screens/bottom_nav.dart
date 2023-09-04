import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/home.dart';
import 'package:insights/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Center(
      child: Text(
        'Bookmarks',
        style: TextStyle(
          fontSize: 20,
          fontVariations: [FontVariation("wght", 700)],
        ),
      ),
    ),
    const Center(
      child: Text(
        'Notifications',
        style: TextStyle(
          fontSize: 20,
          fontVariations: [FontVariation("wght", 700)],
        ),
      ),
    ),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: const Color.fromRGBO(72, 105, 98, 1)),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home.svg',
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/bookmark.svg'),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/notify.svg'),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/person.svg'),
              activeIcon: SvgPicture.asset(
                'assets/person.svg',
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
