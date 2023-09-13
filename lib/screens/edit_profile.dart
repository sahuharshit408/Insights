
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights/screens/profile.dart';

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

class EditProfile extends StatefulWidget{
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(context) {
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: SvgPicture.asset('assets/back.svg'),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontVariations: [
                                FontVariation(
                                  'wght',
                                  600,
                                ),
                              ],
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/share.svg'),
                          ),
                        ],
                      ),
                    ],
                  ),

                   const SizedBox(
                    height: 135,
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
                  height: 58,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                      ),
                        child: const Text(
                          'Change Picture',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: displayWidth(context),
                      child: const Padding(
                          padding: EdgeInsets.only(left: 18.0 , right: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                Text(
                                  'Username',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontVariations: [
                                      FontVariation(
                                        'wght',
                                        600,
                                      ),
                                    ],
                                  ),
                                ),
                            SizedBox(
                              height: 6,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                              ),
                              style: TextStyle(fontSize: 18),
                            ),

                            SizedBox(
                              height: 16,
                            ),

                            Text(
                              'Email Id',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                              ),
                              style: TextStyle(fontSize: 18),
                            ),

                            SizedBox(
                              height: 16,
                            ),

                            Text(
                              'Phone Number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                              ),
                              style: TextStyle(fontSize: 18),
                            ),

                            SizedBox(
                              height: 16,
                            ),

                            Text(
                              'Password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontVariations: [
                                  FontVariation(
                                    'wght',
                                    600,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 6),
                              ),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 30
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
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
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 150,
          right: 0,
          left: 0,
          child: CircleAvatar(
            radius: 78,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
              ),
              radius: 72,
            ),
          ),
        ),
      ],
    );
  }
}