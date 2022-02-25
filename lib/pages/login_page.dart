import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  //Build alert dialog to show error
  Future<void> alertDialogBuider(String error) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text(error),
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

  //Get value from textfield
  final email_controller_login = TextEditingController();
  final password_controller_login = TextEditingController();

  //Sign in account
  Future<String?> signinAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email_controller_login.text,
              password: password_controller_login.text);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  //submit Signin form
  void submitForm() async {
    //Set form loading state
    setState(() {
      showLoading = true;
    });

    //Sign in account
    String? createFeedbackAccount = await signinAccount();

    //If string isn't null => error
    if (createFeedbackAccount != null) {
      alertDialogBuider(createFeedbackAccount);

      //Cancel show loading form
      setState(() {
        showLoading = false;
      });
    } else {
      //co the xoa bo
      Navigator.pop(context);
    }
  }

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
                  valueText: email_controller_login,
                ),
                InputWidget(
                  hintText: 'Password',
                  isPasswordField: true,
                  valueText: password_controller_login,
                ),
                appButton(
                  label: 'Login',
                  onTap: () {
                    setState(() {
                      submitForm();
                    });
                  },
                  outlineBtn: false,
                  isLoading: showLoading,
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
