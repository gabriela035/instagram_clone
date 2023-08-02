import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
    primaryColor: const Color.fromARGB(255, 255, 255, 255),
    colorScheme: const ColorScheme.dark(),
    iconTheme:
        const IconThemeData(color: Color.fromRGBO(86, 84, 84, 1), opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 239, 234, 234),
    primaryColor: const Color.fromARGB(255, 0, 0, 0),
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 37, 36, 36), opacity: 0.8),
  );
}