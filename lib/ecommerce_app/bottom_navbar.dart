
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 0;
  late PageController pageController;

  @override

  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SizedBox.expand(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            Container(color: Colors.white,),
            Container(color: Colors.white,),
            Container(color: Colors.white,),
            Container(color: Colors.white,),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            pageController.jumpToPage(index);
          });

        },
        items: <BottomNavyBarItem> [
          BottomNavyBarItem(
              icon: Icon(Icons.apps), title: Text("Menu")),
          BottomNavyBarItem(
              icon: Icon(Icons.home), title: Text("Home")),
          BottomNavyBarItem(
              icon: Icon(Icons.chat_bubble), title: Text("Messages")),
          BottomNavyBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }
}

