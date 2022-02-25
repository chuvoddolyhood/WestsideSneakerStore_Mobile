import 'package:flutter/material.dart';

class BottomNavigation_Widget extends StatefulWidget {
  @override
  State<BottomNavigation_Widget> createState() =>
      _BottomNavigation_WidgetState();
}

class _BottomNavigation_WidgetState extends State<BottomNavigation_Widget> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.05),
              spreadRadius: 1.5,
              blurRadius: 10.0,
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Button_Nav_Widget(
            titleIcon: "home",
            isSelected: (selectTab == 0) ? true : false,
            onTap: () {
              setState(() {
                selectTab = 0;
              });
            },
          ),
          Button_Nav_Widget(
            titleIcon: "search",
            isSelected: (selectTab == 1) ? true : false,
            onTap: () {
              setState(() {
                selectTab = 1;
              });
            },
          ),
          Button_Nav_Widget(
            titleIcon: "favorite",
            isSelected: (selectTab == 2) ? true : false,
            onTap: () {
              setState(() {
                selectTab = 2;
              });
            },
          ),
          Button_Nav_Widget(
            titleIcon: "logout",
            isSelected: (selectTab == 3) ? true : false,
            onTap: () {
              setState(() {
                selectTab = 3;
              });
            },
          )
        ],
      ),
    );
  }
}

class Button_Nav_Widget extends StatelessWidget {
  final VoidCallback onTap;
  final String titleIcon;
  final bool isSelected;
  const Button_Nav_Widget(
      {Key? key,
      required this.titleIcon,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (titleIcon == "home") {
      return Container(
        child: InkWell(
          onTap: onTap,
          child: Icon(Icons.home,
              size: 30.0, color: isSelected ? Colors.amber : Colors.black),
        ),
      );
    } else if (titleIcon == "search") {
      return Container(
        child: InkWell(
          onTap: onTap,
          child: Icon(Icons.search,
              size: 30.0, color: isSelected ? Colors.amber : Colors.black),
        ),
      );
    } else if (titleIcon == "favorite") {
      return Container(
        child: InkWell(
          onTap: onTap,
          child: Icon(Icons.favorite,
              size: 30.0, color: isSelected ? Colors.amber : Colors.black),
        ),
      );
    } else if (titleIcon == "logout") {
      return Container(
        child: InkWell(
          onTap: onTap,
          child: Icon(Icons.logout,
              size: 30.0, color: isSelected ? Colors.amber : Colors.black),
        ),
      );
    }
    return CircularProgressIndicator();
  }
}
