// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/api/api_service.dart';
import 'package:insights/auth.dart';
import 'package:insights/screens/pr_details_screen.dart';
import 'package:insights/service.dart';
import 'package:provider/provider.dart';
import '../models/press_releases_model.dart';

class HomeCard extends StatelessWidget {
  final PressRelease pr;

  const HomeCard({
    Key? key,
    required this.pr,
  }) : super(key: key);

  @override
  Widget build(context) {
    final provider = Provider.of<PrPovider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.9,
      width: size.width * 0.9,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => PrDetailsScreen(
                  pr: pr,
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
                    image: CachedNetworkImageProvider(pr.imageUrls[0]),
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
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: provider.bookmarks
                                  .any((element) => element.prId == pr.prId)
                              ? InkWell(
                                  onTap: () {
                                    provider.toggleBookmark(pr.prId);
                                  },
                                  child: SvgPicture.asset(
                                    "assets/bookmark-fill.svg",
                                    height: 28,
                                    width: 28,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    provider.toggleBookmark(pr.prId);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/bookmark.svg',
                                    height: 28,
                                    width: 28,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                pr.title ?? "",
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
                              Text(
                                pr.ministry,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            pr.description.join(" ") ?? "",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
