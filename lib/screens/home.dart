import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insights/models/press_releases_model.dart';
import 'package:insights/service.dart';
import 'package:insights/widgets/home_card.dart';
import 'package:insights/utils/loader.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PressReleasesModel>? pressReleasesModel;

  @override
  void initState() {
    getReleases();
    super.initState();
  }

  Future<void> getReleases() async {
    pressReleasesModel = await getPressReleases();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return pressReleasesModel == null
        ? const Loader()
        : pressReleasesModel!.isEmpty
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
                        itemBuilder: (context, index) {
                          if (index == pressReleasesModel!.length) {
                            return SizedBox(
                              height: size.height * 0.1,
                            );
                          }
                          var currPressRelease = pressReleasesModel![index];
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, innerIndex) {
                              var currMinistryPressReleases = currPressRelease
                                  .allPressReleases![innerIndex];
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var pressRelease = currMinistryPressReleases
                                      .pressReleases![i];
                                  return Hero(
                                    tag: pressRelease.prId!,
                                    child: HomeCard(
                                      pr: pressRelease,
                                      ministryName:
                                          currMinistryPressReleases.ministry!,
                                    ),
                                  );
                                },
                                itemCount: currMinistryPressReleases
                                    .pressReleases!.length,
                              );
                            },
                            itemCount:
                                currPressRelease.allPressReleases!.length,
                            shrinkWrap: true,
                          );
                        },
                        itemCount: pressReleasesModel!.length + 1,
                      ),
                    ),
                  ),
                ],
              );
  }
}
