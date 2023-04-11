import 'package:flutter/material.dart';
import 'package:serpay/darkMode/theme_services.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void changeTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(



    scaffoldBackgroundColor: Color.fromRGBO(250, 250, 250, 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      selectedIconTheme: IconThemeData(color: Color.fromRGBO(119, 119, 119, 1)),
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(119, 119, 119, 1)),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 1, color: Color.fromRGBO(107, 107, 108, 1)),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: Color.fromRGBO(250, 250, 250, 1)),
    // toggleableActiveColor: Colors.red,
    textTheme: TextTheme(),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(
          width: 1.5,
          // color: unselectedWidgetColor
        ),
        splashRadius: 0),
    primaryColor: Colors.red,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        // color: Colors.red,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color.fromRGBO(39, 39, 39, 1)),
        elevation: 0,
        iconTheme:
            IconThemeData(color: Color.fromRGBO(41, 41, 41, 1), size: 25)),
  );

  ///dark
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(39, 39, 39, 1),

        unselectedWidgetColor: Colors.red,
        disabledColor: Colors.blue,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(39, 39, 39, 1),
      selectedItemColor: Color.fromRGBO(174, 174, 174, 1),
      unselectedItemColor: Color.fromRGBO(174, 174, 174, 1),
      selectedIconTheme: IconThemeData(color: Color.fromRGBO(174, 174, 174, 1)),
      selectedLabelStyle: TextStyle(color: Color.fromRGBO(174, 174, 174, 1)),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: Color.fromRGBO(97, 97, 97, 1)),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.blue),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: Color.fromRGBO(97, 97, 97, 1)),
    toggleableActiveColor: Colors.red,
    // textTheme: TextTheme(),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(
          width: 1.5,
          // color: unselectedWidgetColor
        ),
        splashRadius: 0),
    primaryColor: Colors.red,

    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        backgroundColor: Color.fromRGBO(39, 39, 39, 1),
        elevation: 0,
        actionsIconTheme:
            IconThemeData(color: Color.fromRGBO(174, 174, 174, 1), size: 25),
        iconTheme: IconThemeData(color: Colors.white, size: 25)),
  );
}
