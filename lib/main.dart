import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/buy/home_screen.dart';
import 'package:flutter/gestures.dart';
void main() => runApp(const PartsAndRidesApp());

class PartsAndRidesApp extends StatelessWidget {
  const PartsAndRidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parts & Rides',
      debugShowCheckedModeBanner: false,
      theme: buildDarkTheme(),
      home: const HomeScreen(),
      scrollBehavior: NoScrollbarBehavior(),
    );
  }
}

class NoScrollbarBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  // Lets you also drag-scroll with the mouse in Chrome
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}