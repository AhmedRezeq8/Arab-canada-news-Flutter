// import 'dart:async';

// import 'package:flutter/material.dart';

// import '../Tools/globals.dart' as g;
// import 'tabbar.dart';

// class SplashScreen extends StatefulWidget {
//   SplashScreen({Key key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class MyCustomRoute<T> extends MaterialPageRoute<T> {
//   MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
//       : super(builder: builder, settings: settings);

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     // if (settings.isInitialRoute) return child;
//     // Fades between routes. (If you don't want any animation,
//     // just return child.)
//     return new FadeTransition(opacity: animation, child: child);
//   }
// }

// class _SplashScreenState extends State<SplashScreen> {
//   void navigationPage() {
//     Navigator.push(context, MyCustomRoute(builder: (context) => MyTabBar()));
//   }

//   startTime() async {
//     var _duration = Duration(seconds: 4);
//     return Timer(_duration, navigationPage);
//   }

//   int x = 0;
//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'assets/images/alroya_app1.png',
//       fit: BoxFit.fill,
//     );
//   }
// }
