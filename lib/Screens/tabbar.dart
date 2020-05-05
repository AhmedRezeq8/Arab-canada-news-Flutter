import 'package:arabcanadanews/Screens/video/videoView.dart';
import 'package:arabcanadanews/Screens/webViewMagazine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Home/Home.dart';
import 'breaknews/breaknews.dart';
import 'categories/CategorieView1.dart';
import 'categories/CategorieView2.dart';
import 'more.dart';

import '../Tools/globals.dart' as g;

class MyTabBar extends StatefulWidget {
  MyTabBar({Key key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int _currentIndex = 0;
  List<Widget> pageList = List<Widget>();

  final tabs = [
    Home(),
    BreakNews(),
    // BreakNews(),
    // MagazineWebView(),
    // AlrayView(),
    VideoView(),
    // CustomScrollViewTestRoute(),
    More()
  ];
  // _magazine() async {
  //   const url = 'https://arabcanadanews.ca/magazine/index.html';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  void initState() {
    pageList.add(Home());
    pageList.add(BreakNews());
    pageList.add(MagazineWebView());
    pageList.add(VideoView());
    pageList.add(More());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          activeColor: g.dark,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          iconSize: 18,
          items: [
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.house),
                title: Text(
                  "الرئيسية",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.flame),
                title: Text(
                  "عاجل",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                // icon: Icon(SFSymbols.money_dollar_circle),
                icon: SvgPicture.asset(
                  'assets/images/file.svg',
                  width: 20.0,
                  height: 20.0,
                  color: null,
                  allowDrawingOutsideViewBox: true,
                ),
                title: Text(
                  "الصحيفة",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.videocam_circle),
                title: Text(
                  "فيديو",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(SFSymbols.ellipsis),
                title: Text(
                  "المزيد",
                  style: TextStyle(
                      fontFamily: "SST-Arabic-Medium",
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          children: pageList,
          index: _currentIndex,
        ),
      ),
    );
  }
}
