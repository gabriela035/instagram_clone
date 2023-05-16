import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/page/credential/sign_in_page.dart';
import 'package:instagram_clone/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_clone/features/presentation/widgets/form_container_widget.dart';

import '../main_screen/main_screen.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: Theme.of(context).primaryColor,
              ),
            ),
            sizeVer(15),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Image.asset("assets/profile_default.png"),
                  ),
                  Positioned(
                    right: 6,
                    bottom: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.upload,
                        color: Color.fromARGB(219, 53, 53, 53),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizeVer(30), //spatiere
            FormContainerWidget(
              hintText: "Username",
            ),
            sizeVer(15),
            FormContainerWidget(
              hintText: "Email",
            ),
            sizeVer(15),
            FormContainerWidget(
              hintText: "Password",
              isPasswordField: true,
            ),
            sizeVer(15),
            FormContainerWidget(
              hintText: "Bio",
            ),
            sizeVer(15),
            ButtonContainerWidget(
              color: darkGreyColor,
              text: "Sign Up",
              onPressed: () {},
              onTapListener: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Divider(
              color: Color.fromARGB(255, 91, 90, 90),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                InkWell(
                  //il face clickable
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                        (route) => false);
                  },
                  child: Text(
                    "Sign In.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
