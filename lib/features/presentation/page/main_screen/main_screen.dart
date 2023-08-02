import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/presentation/page/post/upload_post_page.dart';
import 'package:instagram_clone/features/presentation/page/profile/profile_page.dart';
import 'package:instagram_clone/features/presentation/page/reels/reels_page.dart';
import 'package:instagram_clone/features/presentation/page/search/search_page.dart';
import 'package:line_icons/line_icons.dart';
//import 'package:flutter_icons/flutter_icons.dart';

import '../home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    //ne duce la pagina pe care o selectam
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    //se schimba numele paginii pe care suntem
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon:
                Icon(LineIcons.home, color: Theme.of(context).iconTheme.color),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.search,
                color: Theme.of(context).iconTheme.color),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.plusSquare,
                color: Theme.of(context).iconTheme.color),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.playCircleAlt,
                color: Theme.of(context).iconTheme.color),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.userCircle,
                color: Theme.of(context).iconTheme.color),
            label: "",
          ),
        ],
        onTap: navigationTapped,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomePage(),
          SearchPage(),
          UploadPostPage(),
          ReelsPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
