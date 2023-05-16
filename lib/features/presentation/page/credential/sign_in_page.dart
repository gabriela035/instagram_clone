import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/page/credential/sign_up_page.dart';
import 'package:instagram_clone/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_clone/features/presentation/widgets/form_container_widget.dart';

import '../main_screen/main_screen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
            sizeVer(30), //spatiere
            FormContainerWidget(
              hintText: "Email",
            ),
            sizeVer(15),
            FormContainerWidget(
              hintText: "Password",
              isPasswordField: true,
            ),
            sizeVer(15),
            ButtonContainerWidget(
              color: darkGreyColor,
              text: "Sign In",
              onTapListener: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              onPressed: () {},
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Divider(
              color: Color.fromARGB(255, 62, 62, 62),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                InkWell(
                  //il face clickable
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                        (route) => false);
                  },
                  child: Text(
                    "Sign Up.",
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
