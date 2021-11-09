import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/task_display_page.dart';
import 'screens/task_input_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kAppBarBackgroundColor,//first two is opacity FF is 100%
        ),
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        primaryColor: kPrimaryColor,
        primaryColorLight: kPrimaryColorLight,
        accentColor: kAccentColor,
        errorColor: kErrorColor,
        inputDecorationTheme: kInputDecorationTheme,
      ),
      routes:{
        '/': (context) => TaskDisplayPage(),
        '/addTask': (context) => TaskInputPage(),
      },
        initialRoute: '/',
    ),
  );
}

