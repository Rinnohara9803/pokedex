import 'package:flutter/material.dart';

ThemeData getDarkApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    // primary color
    primaryColor: Colors.black,

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.teal),

    // icon buttom theme
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          Colors.white,
        ),
      ),
    ),

    // icon theme
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),

    // text themes
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 11,
      ),
      displayLarge: TextStyle(
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
      ),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Colors.grey,
      prefixIconColor: Colors.grey,
      fillColor: const Color.fromARGB(255, 53, 52, 52),
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.white),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.red),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.white),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.red),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    ),

    // pop up menu theme
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
    ),

    // app bar theme
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),

    //
    scaffoldBackgroundColor: Colors.black,

    //
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),

    //
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
    ),

    //
    dividerTheme: const DividerThemeData(color: Colors.white),

    //
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),

    //
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),

    //
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromARGB(255, 29, 28, 28),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            20,
          ),
          topLeft: Radius.circular(
            20,
          ),
        ),
      ),
    ),

    //
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(Colors.white),
    ),
  );
}

ThemeData getLightApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    // primary color
    primaryColor: Colors.white,

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.blueAccent),

    // icon buttom theme
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          Colors.black,
        ),
      ),
    ),

    // icon theme
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.black,
    ),

    // text themes
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 11,
      ),
      displayLarge: TextStyle(
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
      ),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: Colors.grey,
      prefixIconColor: Colors.grey,
      fillColor: Colors.black12,
      filled: true,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.white),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.red),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1.5,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.white),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.red),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    ),

    // pop up menu theme
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
    ),

    // app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),

    //
    scaffoldBackgroundColor: Colors.white,

    //
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
    ),

    //
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black54,
    ),

    //
    dividerTheme: const DividerThemeData(color: Colors.black),

    //
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),

    //
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(Colors.black),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    ),

    //
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            20,
          ),
          topLeft: Radius.circular(
            20,
          ),
        ),
      ),
    ),

    //
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(Colors.black),
    ),
  );
}
