// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:insights/screens/story_screen.dart';

import '../models/press_releases_model.dart';

class HomeCard extends StatelessWidget {
  // final String ministryName;
  // final PressReleases pr;
  const HomeCard({
    Key? key,
    // required this.ministryName,
    // required this.pr,
  }) : super(key: key);

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.9,
      width: size.width * 0.9,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StoryScreen(
                  // pr: pr,
                  // ministryName: ministryName,
                ),
              ),
            );
          },
          child: Card(
            elevation: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.network(pr.imageUrls![0]).image,
                    fit: BoxFit.cover),
              ),
              child: DecoratedBox(
                position: DecorationPosition.background,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pr.title!,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontVariations: [
                                FontVariation(
                                  'wght',
                                  700,
                                ),
                              ],
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            pr.descriptiveText!.join(" "),
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Inter",
                              fontVariations: [
                                FontVariation(
                                  'wght',
                                  500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8, // Adjust the position as needed
                        right: 8, // Adjust the position as needed
                        child: IconButton(
                          icon: SvgPicture.asset('assets/bookmark.svg'),
                          onPressed: () {
                            // Handle bookmark button press
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
