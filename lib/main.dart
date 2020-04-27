import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_flutter_portfolio/pages/about_me/about_me_page.dart';

import 'pages/apps/apps_page.dart';
import 'pages/pub_packages/pub_packages_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        items: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpeg'),
            radius: 16,
          ),
          Icon(FontAwesome5Brands.google_play, size: 30),
          Icon(FontAwesome5Brands.git, size: 30),
          Icon(FontAwesome5Brands.medium, size: 30),
        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceInOut,
          );
        },
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            AboutMePage(),
            AppsPage(),
            PubPackagesPage(),
            Container(
              child: Center(
                child: Text('Page 4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
