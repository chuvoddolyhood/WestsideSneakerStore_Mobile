import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/widgets/bottom_nav_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Text('HomePage')),
          BottomNavigation_Widget(),
        ],
      ),
    );
  }
}
