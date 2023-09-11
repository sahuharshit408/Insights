import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insights/Providers/card_provider.dart';
import 'package:insights/constants.dart';
import 'package:insights/screens/pr_details_screen.dart';
import 'package:provider/provider.dart';



class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  Dio dio = Dio(
    BaseOptions(baseUrl: ' https://synth-ai-envoys.onrender.com'),
  );

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  final prProvider = Provider.of<PrPovider>;


  Future<void> fetchData() async {
    try {
      Response response =
          await dio.get('/addPRToBookmark/<prId>'); // Replace with your API endpoint
      if (response.statusCode == 200) {
        // Handle successful response
        final data = response.data;
        // Update your provider with the fetched data
        PrPovider.toggleBookmark(PrPovider()); 
        // Example: prProvider.updateData(data);
      } else {
        // Handle error response
        // Example: prProvider.setErrorState();
      }
    } catch (e) {
      // Handle Dio error
      // Example: prProvider.setErrorState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final prProvider = Provider.of<PrPovider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
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
      body: ListView.builder(
        itemCount: prProvider.bookmarks.length,
        itemBuilder: (context, index) {
          final card = prProvider.bookmarks[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PrDetailsScreen(
                      pr: card,
                    ),
                  ),
                );
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  card.thumbnail, // Replace with your image URL
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Column(
                children: [
                  Text(
                    card.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontVariations: [FontVariation("wght", 700)],
                    ),
                  ),
                  Text(
                    card.description.join(" "),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontVariations: [FontVariation("wght", 400)],
                    ),
                  ),
                ],
              ),
            ),
          ); //yaha pe kya dalenge apan
        },
      ),
    );
  }
}
