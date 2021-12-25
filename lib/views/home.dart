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
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: Color(0xFF212121),
        child: Theme(
          data: ThemeData(
            iconTheme: IconThemeData(
              color: Color(0xFF1c1c1c),
            ),
          ),
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
