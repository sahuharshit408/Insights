import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/bookmark.dart';
import 'package:insights/screens/home.dart';
import 'package:insights/screens/notification_screen.dart';
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

  void changeSelectedScreenIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Home(changeSelectedScreenIndex: changeSelectedScreenIndex),
      Bookmark(changeSelectedScreenIndex: changeSelectedScreenIndex),
      NotificationScreen(changeSelectedScreenIndex: changeSelectedScreenIndex),
      Profile(changeSelectedScreenIndex: changeSelectedScreenIndex),
    ];
    getLocalPrAndBookmarks();
  }

  Future<void> getLocalPrAndBookmarks() async {
    final provider = Provider.of<PrPovider>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // provider.getPrsFromLocal();
      provider.setUserBookmarks(await apiService.getUserBookmark());
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrPovider>(context);
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          duration: const Duration(
            milliseconds: 200,
          ),
          child: _widgetOptions.elementAt(selectedIndex),
        ),
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
              icon: Badge(
                isLabelVisible: provider.bookmarks.isNotEmpty,
                label: Text(provider.bookmarks.length.toString()),
                textColor: Colors.black,
                backgroundColor: Colors.white,
                textStyle: const TextStyle(fontVariations: [
                  FontVariation(
                    'wght',
                    700,
                  ),
                ]),
                child: SvgPicture.asset('assets/bookmark.svg'),
              ),
              label: "",
              activeIcon: Badge(
                  label: Text(provider.bookmarks.length.toString()),
                  isLabelVisible: provider.bookmarks.isNotEmpty,
                  textColor: Colors.white,
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(fontVariations: [
                    FontVariation(
                      'wght',
                      700,
                    ),
                  ]),
                  child: Image.asset('assets/bookmark_active.png')),
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
