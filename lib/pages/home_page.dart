import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/tab/home_tab.dart';
import 'package:westside_sneaker_store/tab/save_tab.dart';
import 'package:westside_sneaker_store/tab/search_tab.dart';
import 'package:westside_sneaker_store/widgets/bottom_nav_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _tabPageController;
  late int _selectedTab = 0; //chon icon tren bottom navigation

  @override
  void initState() {
    _tabPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabPageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
              children: [
                HomeTab(),
                SearchTab(),
                SaveTab(),
              ],
            ),
          ),
          BottomNavigation_Widget(
            selectedTab: _selectedTab,
            tabPressed: (index) {
              _tabPageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic);
            },
          ),
        ],
      ),
    );
  }
}
