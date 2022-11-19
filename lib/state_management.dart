import 'package:flutter/material.dart';
import 'package:state_management/home/view/home_change_notifier.dart';
import 'package:state_management/home/view/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePageChangeNotifier(),
      home: HomePage(),
    );
  }
}
