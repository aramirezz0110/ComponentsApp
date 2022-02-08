//clase con propiedades estaticas
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //color primario
    primaryColor: Colors.indigo,
    //Appbar theme
    appBarTheme: const AppBarTheme(
      color: primary, //color general
      elevation: 0,
    ),
    //TextButton theme
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
    //FloatingActionButton theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 0,
    ),
    //ElevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    //TextFormField theme
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary), //input text color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary), //input text color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      //color primario
      primaryColor: Colors.indigo,
      //Appbar theme
      appBarTheme: const AppBarTheme(
        color: primary, //color general
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.black);
}
