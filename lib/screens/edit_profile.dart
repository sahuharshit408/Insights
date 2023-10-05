// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:insights/constants.dart';

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

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
    required this.dp,
  }) : super(key: key);
  final String dp;

  @override
  State<EditProfile> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  @override
  initState() {
    super.initState();
  }

  bool passwordVisible = false;

  @override
  Widget build(context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 180,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Column(
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
            actions: const [],
            backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
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
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      width: displayWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 36.0, right: 36.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Username',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(169, 169, 169, 1),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          primaryColor), // Color of the border when focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Email Id',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(169, 169, 169, 1)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          primaryColor), // Color of the border when focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Phone Number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(169, 169, 169, 1)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          primaryColor), // Color of the border when focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(169, 169, 169, 1)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            primaryColor), // Color of the border when focused
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 8),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  )),
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !passwordVisible,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
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
                            horizontal: 120,
                            vertical: 14,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Positioned(
          top: 140,
          right: 0,
          left: 0,
          child: Hero(
            tag: "dp",
            child: CircleAvatar(
              radius: 78,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.dp,
                ),
                radius: 72,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
