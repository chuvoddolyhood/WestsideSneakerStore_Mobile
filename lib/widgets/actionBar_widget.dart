import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class ActionBar_Widget extends StatelessWidget {
  final String title;
  final bool hasBack;
  final bool hasBackground;

  const ActionBar_Widget(
      {Key? key,
      required this.hasBack,
      required this.title,
      required this.hasBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: hasBackground
              ? LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1))
              : null),
      padding:
          EdgeInsets.only(top: 56.0, left: 24.0, right: 24.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBack)
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(Icons.arrow_back),
              ),
            ),
          Text(
            title,
            style: appStyles.boldHeading,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8.0)),
            width: 42.0,
            height: 42.0,
            alignment: Alignment.center,
            child: Text(
              '0',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
