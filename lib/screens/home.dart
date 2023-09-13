import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/components/custom_text_field_widget.dart';
import 'package:insights/constants.dart';
import 'package:insights/utils/preference_utlis.dart';
import 'package:insights/widgets/home_card.dart';
import 'package:insights/utils/loader.dart';
import 'package:provider/provider.dart';

import '../models/press_releases_model.dart';
import '../service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service? apiService;
  Timer? _throttle;

  @override
  void initState() {
    final provider = Provider.of<PrPovider>(context, listen: false);
    provider.querySearchController.addListener(() {
      if (_throttle?.isActive ?? false) return;
      _throttle = Timer(const Duration(milliseconds: 500), () {
        // Make your API call here
        final searchText = provider.querySearchController.text;
        // Call your API with searchText
        getPrFromQuery(searchText);
      });
    });
    apiService = Service();
    provider.querySearchController.text.isNotEmpty
        ? getPrFromQuery(provider.querySearchController.text)
        : getReleases();

    super.initState();
  }

  Future<void> getReleases() async {
    try {
      final provider = Provider.of<PrPovider>(context, listen: false);
      List<PressRelease> pressReleasesModel =
          await apiService!.getPressReleases();
      provider.setAllPrs(pressReleasesModel);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPrFromQuery(String q) async {
    try {
      final provider = Provider.of<PrPovider>(context, listen: false);
      List<PressRelease> pressReleasesModel =
          await apiService!.getPrFromQuery(q);
      provider.setAllPrs(pressReleasesModel);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _throttle!.cancel();
  }

  bool isSearchOn = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrPovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/filter_icon.svg",
                    height: 28,
                    width: 28,
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  // reverseDuration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: isSearchOn
                      ? SizedBox(
                          height: 40,
                          width: size.width * 0.6,
                          child: TextField(
                            controller: provider.querySearchController,
                            style: const TextStyle(
                              // fontSize: 12,
                              color: Colors.grey,
                              fontVariations: [
                                FontVariation("wght", 600),
                              ],
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                getPrFromQuery(value);
                              } else {
                                getReleases();
                              }
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: primaryColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              filled: true,
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontVariations: [FontVariation("wght", 500)]),
                              labelStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              fillColor: LoginPageBG,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.2),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                        )
                      : const Text(
                          'INSIGHTS',
                          key: Key("SearchOff"),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchOn = !isSearchOn;
                    });
                  },
                  icon: Image.asset(
                    "assets/material-symbols_search.png",
                    height: 28,
                    width: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
      ),
      body: provider.getAllPrs == null
          ? const Loader()
          : provider.getAllPrs!.isEmpty
              ? const SizedBox.expand(
                  child: Center(
                    child: Text(
                      "Something went wrong!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            if (index == provider.getAllPrs!.length) {
                              return SizedBox(
                                height: size.height * 0.1,
                              );
                            }
                            return HomeCard(
                              pr: provider.getAllPrs![index],
                            );
                          },
                          itemCount: provider.getAllPrs!.length + 1,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
