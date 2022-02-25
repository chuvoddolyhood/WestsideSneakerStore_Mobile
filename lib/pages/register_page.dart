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
  //Build alert dialog to show error
  Future<void> alertDialogBuider() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text('Description'),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'))
            ],
          );
        });
  }

  //default state loading button
  bool showLoading = false;

  //Form input field value
  String email_register = "";
  String password_register = "";

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
                InputWidget(
                  hintText: 'Email',
                  isPasswordField: false,
                ),
                InputWidget(
                  hintText: 'Password',
                  isPasswordField: true,
                ),
                appButton(
                  label: 'Sign in',
                  onTap: () {
                    setState(() {
                      showLoading = true;
                    });
                  },
                  outlineBtn: false,
                  isLoading: showLoading,
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
