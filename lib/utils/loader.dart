// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  final Color color;
  final int size;
  const Loader({
    Key? key,
    this.color = Colors.white,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size.toDouble(),
        width: size.toDouble(),
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}

class NewsLoader extends StatelessWidget {
  const NewsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset("assets/lotties/news_loading.json",
              height: 150, width: 150, fit: BoxFit.cover),
          const Text(
            "Getting latest news...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class BookmarksLoader extends StatelessWidget {
  const BookmarksLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset("assets/lotties/empty_bookmarks.json",
              height: 150, width: 150, fit: BoxFit.cover),
          const SizedBox(height: 20),
          const Text(
            "No bookmarks yet...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
