import 'package:flutter/material.dart';
import 'package:flutter_startup/country_page.dart';
import 'package:flutter_startup/home_page.dart';
import 'package:flutter_startup/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountryPage(),
        debugShowCheckedModeBanner: false);
  }
}
