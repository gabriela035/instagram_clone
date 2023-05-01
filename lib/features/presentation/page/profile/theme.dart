import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/page/profile/theme.dart';

class ThemePage extends StatefulWidget {
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
  @override
  _ThemeEditState createState() => _ThemeEditState();
}

class _ThemeEditState extends State<ThemeEdit> {
  bool _systemSwitch = true;
  bool _lightSwitch = false;
  bool _darkSwitch = false;
  bool _springSwitch = false;

  ThemeMode? _themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            title: Text(
              "Themes",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
            ),
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  size: 32,
                  color: primaryColor,
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
                          style: TextStyle(color: primaryColor))),
                  Switch(
                    value: _systemSwitch,
                    activeColor: greenyColor,
                    onChanged: (newSwitchValue) {
                      _systemSwitch
                          ? print("Blocked")
                          : setState(() {
                              _systemSwitch = true;
                              _lightSwitch = false;
                              _darkSwitch = false;
                              _springSwitch = false;
                              _themeMode = null;
                            });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Dark Mode",
                          style: TextStyle(color: primaryColor))),
                  Switch(
                    value: _darkSwitch,
                    activeColor: greenyColor,
                    onChanged: (newSwitchValue) {
                      _darkSwitch
                          ? print("Blocked")
                          : setState(() {
                              _systemSwitch = false;
                              _lightSwitch = false;
                              _darkSwitch = true;
                              _springSwitch = false;
                              backGroundColor = Color.fromRGBO(0, 0, 0, 1.0);
                              primaryColor = Colors.white;
                              secondaryColor = Colors.grey;
                              darkGreyColor = Color.fromRGBO(97, 97, 97, 1);
                            });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Light Mode ",
                          style: TextStyle(color: primaryColor))),
                  Switch(
                    value: _lightSwitch,
                    activeColor: greenyColor,
                    onChanged: (newSwitchValue) {
                      _lightSwitch
                          ? print("Blocked")
                          : setState(() {
                              _systemSwitch = false;
                              _lightSwitch = true;
                              _darkSwitch = false;
                              _springSwitch = false;
                              backGroundColor = Colors.white;
                              primaryColor = Color.fromRGBO(0, 0, 0, 1.0);
                              secondaryColor = Colors.grey;
                              darkGreyColor = Color.fromRGBO(97, 97, 97, 1);
                            });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Spring Mode ",
                          style: TextStyle(color: primaryColor))),
                  Switch(
                    value: _springSwitch,
                    activeColor: greenyColor,
                    onChanged: (newSwitchValue) {
                      _springSwitch
                          ? print("Blocked")
                          : setState(() {
                              _systemSwitch = false;
                              _lightSwitch = false;
                              _darkSwitch = false;
                              _springSwitch = true;
                              backGroundColor =
                                  Color.fromARGB(255, 76, 116, 76);
                              primaryColor = Color.fromRGBO(212, 201, 212, 1);
                              secondaryColor =
                                  Color.fromARGB(255, 180, 127, 187);
                              darkGreyColor = Color.fromRGBO(133, 173, 149, 1);
                            });
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
