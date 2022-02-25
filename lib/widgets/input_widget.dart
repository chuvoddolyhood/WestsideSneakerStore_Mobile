import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  // final Function onChanged_;
  // final Function onSubmitted_;
  final bool isPasswordField;
  final TextEditingController valueText;
  // final FocusNode focusNode_;
  const InputWidget(
      {Key? key,
      required this.hintText,
      // required this.onChanged_,
      // required this.onSubmitted_,
      required this.isPasswordField,
      required this.valueText
      // required this.focusNode_
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2), borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: valueText,
        // focusNode: focusNode_,
        // onChanged: onChanged_,
        obscureText: _isPasswordField,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
        style: appStyles.darkText,
      ),
    );
  }
}
