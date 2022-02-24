import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';
import 'package:westside_sneaker_store/widgets/button_widget.dart';

import '../widgets/input_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 150.0),
              child: Text(
                'Create new account',
                textAlign: TextAlign.center,
                style: appStyles.boldHeading,
              ),
            ),
            Column(
              children: [
                InputWidget(hintText: 'Email'),
                InputWidget(hintText: 'Password'),
                appButton(
                  label: 'Sign in',
                  onTap: () {
                    print('abc');
                  },
                  outlineBtn: false,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: RawMaterialButton(
                fillColor: Colors.white,
                elevation: 0,
                shape: CircleBorder(),
                onPressed: () {
                  //Xoa context cua landing page
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
