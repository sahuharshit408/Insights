// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:insights/screens/full_screen_image.dart';

import '../models/press_releases_model.dart';

class PrDetailsScreen extends StatelessWidget {
  final PressRelease pr;
  const PrDetailsScreen({
    Key? key,
    required this.pr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(188, 203, 206, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'INSIGHTS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
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
                  tag: pr.prId,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FullScreenImage(
                          imageUrl: pr.thumbnail,
                          pr: pr,
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
                              pr.thumbnail,
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
                    pr.title,
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
                    pr.description.join("\n\n"),
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
