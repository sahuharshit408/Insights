import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/bookmark.dart';
import 'package:insights/screens/home.dart';
import 'package:insights/screens/profile.dart';
import 'package:insights/service.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> {
  Service apiService = Service();
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Bookmark(),
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
  void initState() {
    super.initState();
    getLocalPrAndBookmarks();
  }

  Future<void> getLocalPrAndBookmarks() async {
    final provider = Provider.of<PrPovider>(context, listen: false);

    provider.getPrsFromLocal();
    provider.setUserBookmarks(await apiService.getUserBookmark());
  }

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
              icon: Image.asset('assets/home_active.png'),
              label: "",
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/bookmark.svg'),
              label: "",
              activeIcon: Image.asset('assets/bookmark_active.png'),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/notify.svg'),
              label: "",
              activeIcon: Image.asset('assets/notification_active.png'),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/person.svg'),
              activeIcon: Image.asset(
                'assets/profile_active.png',
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
