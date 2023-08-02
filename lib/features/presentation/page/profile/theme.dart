import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return ThemeEdit(); // Return an instance of ThemeEdit here
  }
}

class ThemeEdit extends StatefulWidget {
  const ThemeEdit({super.key});

  @override
  _ThemeEditState createState() => _ThemeEditState();
}

class _ThemeEditState extends State<ThemeEdit> {
  bool _systemSwitch = true;
  bool _lightDarkModeEnabled = false;

  ThemeMode? _themeMode;

  //get actions => null;
  @override
  void initState() {
    super.initState();
    _themeMode = ThemeMode.system; // Set initial theme mode to system
    _systemSwitch = true;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    _themeMode = themeProvider.themeMode;
    _lightDarkModeEnabled = _themeMode != ThemeMode.system;
    return MaterialApp(
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Themes",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                size: 32,
                color: Theme.of(context).iconTheme.color,
              )),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("System Mode",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                Switch(
                    value: _systemSwitch,
                    activeColor: greenyColor,
                    onChanged: (newSwitchValue) {
                      setState(() {
                        _systemSwitch = true;
                        _themeMode = ThemeMode.system;
                        themeProvider.toggleTheme(
                            false); // Set theme to light when system mode is enabled
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Light/Dark Mode",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                // actions[ChangeThemeButtonWidget()],
                // ],
                Switch.adaptive(
                  value: _lightDarkModeEnabled && _themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    setState(
                      () {
                        _systemSwitch = false;
                        _themeMode = _lightDarkModeEnabled
                            ? (value ? ThemeMode.dark : ThemeMode.light)
                            : ThemeMode.system;
                        themeProvider.toggleTheme(_themeMode == ThemeMode.dark);
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
