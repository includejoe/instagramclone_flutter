import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:instagram_clone/utils/colors.dart";
import "package:instagram_clone/utils/constants.dart";

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void navigationClicked(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: Constants.screens,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBgColor,
        onTap: navigationClicked,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentPage == 0 ? primaryColor : secondaryColor ,
            ),
            label: "",
            backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _currentPage == 1 ? primaryColor : secondaryColor ,
              ),
              label: "",
              backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: _currentPage == 2 ? primaryColor : secondaryColor ,
              ),
              label: "",
              backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: _currentPage == 3 ? primaryColor : secondaryColor ,
              ),
              label: "",
              backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _currentPage == 4 ? primaryColor : secondaryColor ,
              ),
              label: "",
              backgroundColor: primaryColor
          ),
        ],
      ),
    );
  }
}
