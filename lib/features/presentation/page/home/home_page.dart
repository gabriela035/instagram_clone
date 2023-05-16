import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/page/story/story_aspect.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: SvgPicture.asset(
          "assets/ic_instagram.svg",
          color: Theme.of(context).primaryColor,
          height: 32,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Icon(
                  LineIcons.heart,
                  color: Theme.of(context).iconTheme.color,
                  size: 28.0,
                ),
                SizedBox(width: 13.0),
                Icon(
                  LineIcons.facebookMessenger,
                  color: Theme.of(context).iconTheme.color,
                  size: 28.0,
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //story/
            SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stories();
                },
              ),
            ),
            //\story
            sizeVer(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: secondaryColor, shape: BoxShape.circle),
                    ),
                    sizeHor(10),
                    Text(
                      "Username",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  color: Theme.of(context).iconTheme.color,
                )
              ],
            ),
            sizeVer(10),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              color: secondaryColor,
            ),
            sizeVer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    sizeHor(10),
                    Icon(
                      Icons.comment,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    sizeHor(10),
                    Icon(
                      Icons.send,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ],
                ),
                Icon(
                  Icons.bookmark_border,
                  color: Theme.of(context).iconTheme.color,
                )
              ],
            ),
            sizeVer(10),
            Text(
              "5 likes",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            sizeVer(10),
            Row(
              children: [
                Text(
                  "Username",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                sizeHor(10),
                Text(
                  "some description",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            sizeVer(10),
            Text(
              "View all 10 comments",
              style: TextStyle(color: darkGreyColor),
            ),
            sizeVer(10),
            Text(
              "08/5/2022",
              style: TextStyle(color: darkGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
