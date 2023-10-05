// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:insights/widgets/date_picker_text_field.dart';
import 'package:provider/provider.dart';

import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/constants.dart';
import 'package:insights/utils/loader.dart';
import 'package:insights/widgets/home_card.dart';

import '../models/press_releases_model.dart';
import '../service.dart';

class Home extends StatefulWidget {
  final Function(int index) changeSelectedScreenIndex;
  const Home({
    Key? key,
    required this.changeSelectedScreenIndex,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service? apiService;
  Timer? _throttle;

  static const _pageSize = 10;

  final PagingController<int, PressRelease> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    // final provider = Provider.of<PrPovider>(context, listen: false);
    _initListeners();

    apiService = Service();
    // provider.querySearchController.text.isNotEmpty
    //     ? getPrFromQuery(provider.querySearchController.text)
    //     : getReleases();

    super.initState();
  }

  String? query;
  Future<void> _initListeners() async {
    final provider = Provider.of<PrPovider>(context, listen: false);

    provider.querySearchController.addListener(() {
      if (_throttle?.isActive ?? false) return;
      _throttle = Timer(const Duration(milliseconds: 500), () async {
        // Make your API call here
        final searchText = provider.querySearchController.text;
        // Call your API with searchText
        // getPrFromQuery(searchText);
        if (query == searchText) return;
        query = searchText;
        _pagingController.refresh();
        final prs = await apiService!.getPrFromQuery(q: searchText);
        if (prs.length < _pageSize) {
          if (_pagingController.itemList != null) {
            prs.removeWhere((e) => _pagingController.itemList!
                .any((element) => element.prId == e.prId));
          }
          _pagingController.appendLastPage(prs);
        } else {
          _pagingController.appendPage(prs, 1);
        }
        provider.setAllPrs(_pagingController.itemList ?? []);
      });
    });

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, provider.querySearchController.text);
    });

    provider.querySearchController.text = " ";
  }

  Future<void> _fetchPage(int pageKey, String query) async {
    try {
      var newItems = await Service()
          .getPrFromQuery(q: query, page: pageKey + 1, itemsCount: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (_pagingController.itemList != null) {
        newItems.removeWhere((e) => _pagingController.itemList!
            .any((element) => element.prId == e.prId));
      }
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> getReleases() async {
    try {
      final provider = Provider.of<PrPovider>(context, listen: false);
      List<PressRelease> pressReleasesModel =
          await apiService!.getPressReleases();
      provider.setAllPrs(pressReleasesModel, saveToLocal: true);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> getPrFromQuery(String q) async {
  //   try {
  //     final provider = Provider.of<PrPovider>(context, listen: false);
  //     List<PressRelease> pressReleasesModel =
  //         await apiService!.getPrFromQuery(q);
  //     provider.setAllPrs(pressReleasesModel);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _throttle?.cancel();
    _scrollController.dispose();
    textFieldFocusNode.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  FocusNode textFieldFocusNode = FocusNode();
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) =>
                          StatefulBuilder(builder: (context, setDialogState) {
                        return AlertDialog(
                            title: const Text(
                              "Filters",
                              style: TextStyle(
                                fontSize: 20,
                                fontVariations: [FontVariation("wght", 600)],
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Ministry: ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontVariations: [
                                          FontVariation("wght", 600)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: provider.selectedMinistry,
                                        borderRadius: BorderRadius.circular(10),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        menuMaxHeight: 200,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontVariations: [
                                              FontVariation("wght", 600)
                                            ]),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String? newValue) {
                                          provider.setSelectedMinistry(
                                              newValue ?? "");
                                          setDialogState(() {});
                                        },
                                        items: provider.ministries
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontVariations: [
                                                    FontVariation("wght", 600)
                                                  ]),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Language: ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontVariations: [
                                          FontVariation("wght", 600)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: provider.selectedLanguage,
                                        borderRadius: BorderRadius.circular(10),
                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 24,
                                        elevation: 16,
                                        menuMaxHeight: 200,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontVariations: [
                                              FontVariation("wght", 600)
                                            ]),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.grey,
                                        ),
                                        onChanged: (String? newValue) {
                                          provider.setSelectedLanguage(
                                              newValue ?? "");
                                          setDialogState(() {});
                                        },
                                        items: provider.languages
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontVariations: [
                                                    FontVariation("wght", 600)
                                                  ]),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Date: ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontVariations: [
                                          FontVariation("wght", 600)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: DatePickerTextField(),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      }),
                    );
                  },
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
                            focusNode: textFieldFocusNode,
                            controller: provider.querySearchController,
                            style: const TextStyle(
                              // fontSize: 12,
                              color: Colors.grey,
                              fontVariations: [
                                FontVariation("wght", 600),
                              ],
                            ),
                            // onSubmitted: (value) {
                            //   if (value.trim().isNotEmpty) {
                            //     getPrFromQuery(value.trim());
                            //   } else {
                            //     getReleases();
                            //   }
                            // },
                            maxLines: 1,
                            decoration: InputDecoration(
                              suffixIcon: provider
                                      .querySearchController.text.isEmpty
                                  ? null
                                  : GestureDetector(
                                      onTap: () {
                                        provider.querySearchController.clear();
                                      },
                                      child: const Icon(
                                        Icons.highlight_remove,
                                        color: Colors.grey,
                                      ),
                                    ),
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
                      if (isSearchOn) {
                        textFieldFocusNode.requestFocus();
                      }
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
          ? const NewsLoader()
          : provider.getAllPrs!.isEmpty
              ? const SizedBox.expand(
                  child: Center(
                    child: Text(
                      "No Press Preleases Found!",
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

                        // child: ListView.builder(
                        //   controller: _scrollController,
                        //   clipBehavior: Clip.none,
                        //   itemBuilder: (context, index) {
                        //     if (index == provider.getAllPrs!.length) {
                        //       return SizedBox(
                        //         height: size.height * 0.1,
                        //       );
                        //     }
                        //     return HomeCard(
                        //       pr: provider.getAllPrs![index],
                        //     );
                        //   },
                        //   itemCount: provider.getAllPrs!.length + 1,
                        // ),
                        child: Scrollbar(
                          controller: _scrollController,
                          child: PagedListView<int, PressRelease>(
                            clipBehavior: Clip.none,
                            pagingController: _pagingController,
                            scrollController: _scrollController,
                            builderDelegate:
                                PagedChildBuilderDelegate<PressRelease>(
                              itemBuilder: (context, item, index) => HomeCard(
                                pr: item,
                              ),
                              animateTransitions: true,
                              firstPageProgressIndicatorBuilder: (context) =>
                                  const NewsLoader(),
                              // newPageProgressIndicatorBuilder: (context) =>
                              //     const NewsLoader(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
