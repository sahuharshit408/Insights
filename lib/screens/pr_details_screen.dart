// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/full_screen_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/press_releases_model.dart';

class PrDetailsScreen extends StatefulWidget {
  final PressRelease pr;
  const PrDetailsScreen({
    Key? key,
    required this.pr,
  }) : super(key: key);

  @override
  State<PrDetailsScreen> createState() => _PrDetailsScreenState();
}

class _PrDetailsScreenState extends State<PrDetailsScreen> {
  List<String> imagesVideosList = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.pr.videoUrls.length; i++) {
      imagesVideosList.add(widget.pr.videoUrls[i].url ?? "");
    }
    for (int i = 0; i < widget.pr.imageUrls.length; i++) {
      imagesVideosList.add(widget.pr.imageUrls[i]);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _currentPage = 0;

  final CarouselController _carouselController = CarouselController();

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
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: size.width * 0.7,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    pageViewKey: const PageStorageKey("carousel"),
                    onPageChanged: (index, reason) {
                      _currentPage = index;
                      setState(() {});
                    },
                  ),

                  items: imagesVideosList.map((e) {
                    return e.contains("mp4")
                        ? VideoWidget(videoUrl: e)
                        : Hero(
                            tag: widget.pr.prId ?? "",
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      FullScreenImage(
                                    imageUrl: e,
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
                                      image: CachedNetworkImageProvider(
                                        e,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                  }).toList(),

                  // child: SizedBox(
                  //   height: size.width * 0.7,
                  //   width: double.infinity,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: Image.network(
                  //           widget.pr.thumbnail,
                  //         ).image,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentPage,
                    count: imagesVideosList.length,
                    onDotClicked: (index) {
                      _carouselController.animateToPage(index);
                      setState(() {});
                    },
                    effect: const WormEffect(
                      dotColor: greyShade300,
                      spacing: 4,
                      dotHeight: 5,
                      dotWidth: 20,
                      activeDotColor: greyShade600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  child: Text(
                    widget.pr.title ?? "",
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
                    widget.pr.description.join("\n\n") ?? "",
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

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  final String videoUrl;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  late CustomVideoPlayerWebSettings _customVideoPlayerWebSettings;

  @override
  void initState() {
    super.initState();
    _customVideoPlayerWebSettings = CustomVideoPlayerWebSettings(
      src: widget.videoUrl,
    );
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.videoUrl,
      ),
    )..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          kIsWeb
              ? Expanded(
                  child: CustomVideoPlayerWeb(
                    customVideoPlayerWebController:
                        _customVideoPlayerWebController,
                  ),
                )
              : CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
        ],
      ),
    );
  }
}
