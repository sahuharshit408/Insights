// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:insights/Providers/pr_provider.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/pr_details_screen.dart';
import 'package:insights/utils/loader.dart';

class Bookmark extends StatefulWidget {
  final Function(int index) changeSelectedScreenIndex;
  const Bookmark({
    Key? key,
    required this.changeSelectedScreenIndex,
  }) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final prProvider = Provider.of<PrPovider>;

  @override
  Widget build(BuildContext context) {
    final prProvider = Provider.of<PrPovider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => widget.changeSelectedScreenIndex(0),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontVariations: [FontVariation("wght", 700)],
          ),
        ),
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
      ),
      body: prProvider.bookmarks.isEmpty
          ? const BookmarksLoader()
          : ListView.builder(
              itemCount: prProvider.bookmarks.length,
              itemBuilder: (context, index) {
                final card = prProvider.bookmarks[index];
                return Dismissible(
                  key: Key(card.prId),
                  onDismissed: (direction) {
                    prProvider.toggleBookmark(card.prId);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        CupertinoModalPopupRoute(
                          builder: (context) => PrDetailsScreen(
                            pr: card,
                          ),
                        ),
                      ),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                card.imageUrls[
                                    0], // Replace with your image URL
                                height: 100,
                                width: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  children: [
                                    Text(
                                      card.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontVariations: [
                                          FontVariation("wght", 700)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      card.description.join(" "),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontVariations: [
                                          FontVariation("wght", 400)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ); //yaha pe kya dalenge apan
              },
            ),
    );
  }
}
