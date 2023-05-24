import 'package:flutter/material.dart';
import 'package:foodly/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF272727),
        primarySwatch: MaterialColor(
          0xFF272727,
          <int, Color>{
            50: Color(0xFF272727),
            100: Color(0xFF272727),
            200: Color(0xFF272727),
            300: Color(0xFF272727),
            400: Color(0xFF272727),
            500: Color(0xFF272727),
            600: Color(0xFF272727),
            700: Color(0xFF272727),
            800: Color(0xFF272727),
            900: Color(0xFF272727),
          },
        ),
      ),
      home: const RestaurantPage(),
    );
  }
}
