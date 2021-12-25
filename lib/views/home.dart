import 'package:challengeapp/views/mainPages/challenges_page.dart';
import 'package:challengeapp/views/mainPages/my_challenges_page.dart';
import 'package:challengeapp/views/mainPages/profile_page.dart';
import 'package:challengeapp/views/mainPages/search_page.dart';
import 'package:challengeapp/widgets/bottom_nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  var _appPageController = PageController();

  var pages = [
    ChallengesPage(),
    SearchPage(),
    MyChallengesPage(),
    ProfilePage(),
  ];

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _appPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: const Color(0xFF212121),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            bottomNavButton(
              context: context,
              icon: Icons.home_filled,
              isTap: currentIndex == 0,
              onTap: () {
                setBottomBarIndex(0);
              },
            ),
            bottomNavButton(
              context: context,
              icon: CupertinoIcons.search,
              isTap: currentIndex == 1,
              onTap: () {
                setBottomBarIndex(1);
              },
            ),
            bottomNavButton(
              context: context,
              icon: CupertinoIcons.bolt_horizontal_fill,
              isTap: currentIndex == 2,
              onTap: () {
                setBottomBarIndex(2);
              },
            ),
            bottomNavButton(
              context: context,
              icon: CupertinoIcons.person_alt,
              isTap: currentIndex == 3,
              onTap: () {
                setBottomBarIndex(3);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: _appPageController,
        ),
      ),
    );
  }
}
