// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'settings.dart';
import 'articles.dart';
import 'dashboard.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PageController _pageController;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar of the page
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Dashboard(),
          Articles(),
          Settings(),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: selectedPage == 0 ? Colors.blue : Colors.grey,
              onPressed: () {
                _pageController.jumpToPage(0);
                setState(() {
                  selectedPage = 0;
                });
              },
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
            ),
            IconButton(
              color: selectedPage == 1 ? Colors.blue : Colors.grey,
              onPressed: () {
                _pageController.jumpToPage(1);
                setState(() {
                  selectedPage = 1;
                });
              },
              icon: Icon(
                Icons.article,
                size: 30.0,
              ),
            ),
            IconButton(
              color: selectedPage == 2 ? Colors.blue : Colors.grey,
              onPressed: () {
                _pageController.jumpToPage(2);
                setState(() {
                  selectedPage = 2;
                });
              },
              icon: Icon(
                Icons.settings,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
