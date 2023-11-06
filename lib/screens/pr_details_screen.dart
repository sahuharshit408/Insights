// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/full_screen_image.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/press_releases_model.dart';

class PrDetailsScreen extends StatefulWidget {
  const PrDetailsScreen({
    Key? key,
    required this.pr,
  }) : super(key: key);

  final PressRelease pr;

  @override
  State<PrDetailsScreen> createState() => _PrDetailsScreenState();
}

class _PrDetailsScreenState extends State<PrDetailsScreen> {
  List<String> imagesVideosList = [];
  late var selectedAudio;

  final CarouselController _carouselController = CarouselController();
  int _currentPage = 0;
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    for (int i = 0; i < widget.pr.audioUrls.length; i++) {
      audioPlayerMap[widget.pr.audioUrls[i].language]!.dispose();
    }
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(
          widget.pr.videoUrl,
        ),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((value) => setState(() {}));
    selectedAudio = widget.pr.audioUrls[0];
    super.initState();
    initializeAudio();
    imagesVideosList.add(widget.pr.videoUrl);
    for (int i = 0; i < widget.pr.imageUrls.length; i++) {
      imagesVideosList.add(widget.pr.imageUrls[i]);
    }
  }

  void playAudio(VideoPlayerValue value) async {
    bool play = value.isPlaying;
    if (play) {
      audioPlayerMap[selectedAudio.language]!.play(
        UrlSource(selectedAudio.url),
      );
    } else {
      audioPlayerMap[selectedAudio.language]!.pause();
    }
    final position =
        await audioPlayerMap[selectedAudio.language]!.getCurrentPosition();

    try {
      audioPlayerMap[selectedAudio.language]!
          .seek(Duration(seconds: value.position.inSeconds));
    } catch (e) {
      print(e);
    }
    print(
        "VIDEO PLAYER POSITION: ${value.position} AUDIO PLAYER POSITION: $position");
  }

  Map<String, AudioPlayer> audioPlayerMap = {};
  void initializeAudio() async {
    for (int i = 0; i < widget.pr.audioUrls.length; i++) {
      final tempAudioPlayer = AudioPlayer();
      await tempAudioPlayer.setSourceUrl(widget.pr.audioUrls[i].url);
      await tempAudioPlayer.setVolume(1.0);
      audioPlayerMap[widget.pr.audioUrls[i].language] = tempAudioPlayer;
    }
  }

  void changeAudio(value, prev) async {
    print("PREV: $prev VALUE: $value");
    _videoPlayerController.pause();
    audioPlayerMap[prev]!.pause();

    final selectedAudioTemp = widget.pr.audioUrls
        .firstWhere((element) => element.language == value.toString());
    audioPlayerMap[value]!.play(UrlSource(selectedAudioTemp.url));
    audioPlayerMap[value]!.seek((await _videoPlayerController.position)!);
    _videoPlayerController.play();
    print("AUDIO SOURCE ${audioPlayerMap[selectedAudio.language]!.source}");
  }

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
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: VideoWidget(
                                  videoUrl: e,
                                  onPlay: (videoPlayerValue) {
                                    playAudio(videoPlayerValue);
                                  },
                                  videoController: _videoPlayerController,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Change Audio Language: ",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontVariations: [
                                            FontVariation(
                                              'wght',
                                              500,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton(
                                        items: widget.pr.audioUrls
                                            .map(
                                              (e) => DropdownMenuItem(
                                                value: e.language,
                                                child: Text(
                                                  "${languageCodeToLanguageNames[e.language]} (${e.language})",
                                                  style: const TextStyle(
                                                    fontFamily: "Inter",
                                                    fontSize: 14,
                                                    fontVariations: [
                                                      FontVariation(
                                                        'wght',
                                                        200,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          changeAudio(
                                              value, selectedAudio.language);
                                          selectedAudio = widget.pr.audioUrls
                                              .firstWhere((element) =>
                                                  element.language ==
                                                  value.toString());
                                          setState(() {});
                                        },
                                        hint: Text(
                                          languageCodeToLanguageNames[
                                              selectedAudio.language]!,
                                          style:
                                              const TextStyle(fontVariations: [
                                            FontVariation(
                                              'wght',
                                              500,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : Hero(
                            tag: widget.pr.prId,
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
                      left: 20, right: 20, top: 20, bottom: 0),
                  child: Text(
                    widget.pr.title,
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
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pr.ministry,
                        style: const TextStyle(
                          fontFamily: "Raleway",
                          fontVariations: [
                            FontVariation(
                              'wght',
                              600,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(
                          DateTime.fromMillisecondsSinceEpoch(
                            widget.pr.date.toInt(),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: "Raleway",
                          fontVariations: [
                            FontVariation(
                              'wght',
                              300,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    widget.pr.description.join("\n\n"),
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
    required this.videoController,
    this.onPlay,
  }) : super(key: key);

  final Function(VideoPlayerValue isPlaying)? onPlay;
  final VideoPlayerController videoController;
  final String videoUrl;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

bool isPlaying = false;

class _VideoWidgetState extends State<VideoWidget> {
  late CustomVideoPlayerController _customVideoPlayerController;
  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(
    showSeekButtons: true,
    placeholderWidget: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    ),
  );

  late CustomVideoPlayerWebController _customVideoPlayerWebController;
  late CustomVideoPlayerWebSettings _customVideoPlayerWebSettings;
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _customVideoPlayerWebSettings = CustomVideoPlayerWebSettings(
      src: widget.videoUrl,
    );
    _videoPlayerController = widget.videoController;

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
    _videoPlayerController.setVolume(0.0);
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isPlaying) {
        // Video is playing
        if (!isPlaying) {
          setState(() {
            isPlaying = true;
          });
          if (widget.onPlay != null) {
            widget.onPlay!(_videoPlayerController.value);
          }
          print(isPlaying);
        }
      } else {
        // Video is paused
        if (isPlaying) {
          setState(() {
            isPlaying = false;
          });
          if (widget.onPlay != null) {
            widget.onPlay!(_videoPlayerController.value);
          }
          print(isPlaying);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomVideoPlayer(
      customVideoPlayerController: _customVideoPlayerController,
    );
  }
}
