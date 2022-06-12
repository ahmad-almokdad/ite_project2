import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stylish/constants.dart';

class ZoomDrawerTest extends StatefulWidget {
  const ZoomDrawerTest({Key? key}) : super(key: key);

  @override
  _ZoomDrawerTestState createState() => _ZoomDrawerTestState();
}

class _ZoomDrawerTestState extends State<ZoomDrawerTest> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      borderRadius: 40.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.,
        //get color orange
        width: double.infinity,
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Stylish',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              icon: const Icon(Icons.menu))),
      body: null,
    );
  }
}
