import 'package:flutter/material.dart';
import 'package:instagram_clone/features/presentation/page/home/home_page.dart';
import 'package:instagram_clone/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'features/presentation/page/credential/sign_in_page.dart';
import 'features/presentation/page/credential/sign_up_page.dart';
import 'features/presentation/page/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "InstaClone",
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            home: SignInPage(),
          );
        },
      );
}
