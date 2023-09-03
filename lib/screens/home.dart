import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights/widgets/home_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
          bottom: AppBar(
            backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/filter_icon.svg"),
              ),
              const SizedBox(
                width: 80,
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
              const SizedBox(
                width: 80,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/material-symbols_search.png"),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical :8.0),
          child: HomeCard(),
        ),
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromRGBO(72, 105, 98, 1)
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(72, 105, 98, 1),
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Home();
                      },
                    ),
                  );
                },
                icon: SvgPicture.asset('assets/home.svg',),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
                },
                icon: SvgPicture.asset('assets/bookmark.svg'),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
                },
                icon: SvgPicture.asset('assets/notify.svg'),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home(),),);
                },
                icon: SvgPicture.asset('assets/person.svg'),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
