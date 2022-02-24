import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/pages/landing_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Xoa banner debug phia tren goc phai man hinh
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
