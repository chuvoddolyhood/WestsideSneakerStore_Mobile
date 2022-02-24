import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  const InputWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(30)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
        style: appStyles.darkText,
      ),
    );
  }
}
