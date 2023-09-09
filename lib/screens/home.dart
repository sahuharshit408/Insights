import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights/constants.dart';
import 'package:insights/widgets/home_card.dart';
import 'package:insights/utils/loader.dart';

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
                const Text(
                  'INSIGHTS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.justify,
                ),
                IconButton(
                  onPressed: () {},
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
      body: pressReleasesModel == null
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
                ),
    );
  }
}
