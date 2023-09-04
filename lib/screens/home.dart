import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights/widgets/home_card.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: SvgPicture.asset("assets/filter_icon.svg"),
                ),
                const Text(
                  'GOVSNAP',
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
                  icon: Image.asset("assets/material-symbols_search.png"),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical :8.0),
          child: HomeCard(),
        ),
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}