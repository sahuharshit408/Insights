// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:insights/screens/full_screen_image.dart';

import '../models/press_releases_model.dart';

class StoryScreen extends StatefulWidget {
  // final String ministryName;
  // final PressReleases pr;
  const StoryScreen({
    Key? key,
    // required this.ministryName,
    // required this.pr,
  }) : super(key: key);

  @override
  State<StoryScreen> createState() {
    return _StoryCardState();
  }
}

class _StoryCardState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(188, 203, 206, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Insights',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontFamily: 'Inter',
          ),
          textAlign: TextAlign.justify,
        ),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Hero(
                  tag: widget.pr.prId!,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FullScreenImage(
                          imageUrl: widget.pr.imageUrls![0],
                          pr: widget.pr,
                        ),
                      ));
                    },
                    child: SizedBox(
                      height: size.width * 0.7,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.network(
                              widget.pr.imageUrls![0],
                            ).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: Text(
                    widget.pr.title!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: "Inter",
                      fontVariations: [
                        FontVariation(
                          'wght',
                          700,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    widget.pr.descriptiveText!.join("\n\n"),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Inter",
                      fontVariations: [
                        FontVariation(
                          'wght',
                          400,
                        ),
                      ],
                      color: Color.fromRGBO(0, 0, 0, 0.80),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
