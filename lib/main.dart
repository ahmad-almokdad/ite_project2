import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/drawer/drawer.dart';
import 'package:stylish/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: const ZoomDrawer(
        style: DrawerStyle.Style1,
        menuScreen: const MenuScreen(),
        mainScreen: const HomeScreen(),
        borderRadius: 40.0,
        showShadow: true,
        angle: -12.0,
        backgroundColor: Colors.grey,
        // slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.easeIn,
        closeCurve: Curves.easeInOut,
      ),
    );
  }
}
