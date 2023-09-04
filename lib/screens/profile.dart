import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/edit_profile.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ${displaySize(context).height}');
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ${displaySize(context).width}');
  return displaySize(context).width;
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 180,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.transparent,
                          fontSize: 15,
                          fontVariations: [
                            FontVariation(
                              'wght',
                              600,
                            ),
                          ],
                          fontFamily: 'Inter',
                        ),
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontVariations: [
                            FontVariation(
                              'wght',
                              600,
                            ),
                          ],
                          fontFamily: 'Inter',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/notify.svg'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            actions: const [],
            backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 7, 12, 11),
                        ),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      width: displayWidth(context),
                      height: 40,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            Text(
                              'Mini Headline',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          const Text(
                            'Popular',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    500,
                                  ),
                                ],
                                color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          const Text(
                            'Trending',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    500,
                                  ),
                                ],
                                color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          const Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontVariations: [
                                FontVariation(
                                  'wght',
                                  500,
                                ),
                              ],
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      width: displayWidth(context),
                      height: 40,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            Text(
                              'Content',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/heart.svg',
                            width: 20,
                          ), //this is not showing
                          const SizedBox(width: 10),
                          const Text(
                            'Favourite',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Inter",
                              fontVariations: [
                                FontVariation(
                                  'wght',
                                  500,
                                ),
                              ],
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/download.svg',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Download',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    500,
                                  ),
                                ],
                                color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      width: displayWidth(context),
                      height: 40,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Row(
                          children: [
                            Text(
                              'Prefercences',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/Translate.svg',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Language',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    500,
                                  ),
                                ],
                                color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/u_moon.svg',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    500,
                                  ),
                                ],
                                color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/wifi.svg',
                            width: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Only Download via Wifi',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    500,
                                  ),
                                ],
                                color: Colors.black),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/Group 64.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 7, 12, 11),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 120,
          right: 0,
          left: 0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            ),
            radius: 60,
          ),
        ),
      ],
    );
  }
}
