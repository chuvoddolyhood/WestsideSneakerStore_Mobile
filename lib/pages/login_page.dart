import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/pages/register_page.dart';
import 'package:westside_sneaker_store/values/text_style.dart';
import 'package:westside_sneaker_store/widgets/button_widget.dart';
import 'package:westside_sneaker_store/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Welcome user,\n Login to your account',
                textAlign: TextAlign.center,
                style: appStyles.boldHeading,
              ),
            ),
            Column(
              children: [
                InputWidget(
                  hintText: 'Email',
                  isPasswordField: false,
                ),
                InputWidget(
                  hintText: 'Password',
                  isPasswordField: true,
                ),
                appButton(
                  label: 'Login',
                  onTap: () {
                    print('abc');
                  },
                  outlineBtn: false,
                  isLoading: false,
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: appButton(
                  label: 'Create New Account',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  outlineBtn: true,
                  isLoading: false,
                ))
          ],
        ),
      ),
    ));
  }
}
