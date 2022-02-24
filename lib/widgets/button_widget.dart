import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class appButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool outlineBtn;
  const appButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.outlineBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn;
    return InkWell(
      //Event
      onTap: () {
        onTap();
      },

      //Design
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: _outlineBtn ? Colors.transparent : Colors.black,
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16, color: _outlineBtn ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
