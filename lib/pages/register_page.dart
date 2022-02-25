import 'package:firebase_auth/firebase_auth.dart';
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
  final email_controller_register = TextEditingController();
  final password_controller_register = TextEditingController();

  // Create user account
  Future<String?> createUser() async {
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(
    //           email: "barry.allen@example.com",
    //           password: "SuperSecretPassword!");
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print(e);
    // }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email_controller_register.text,
          password: password_controller_register.text);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void submitForm() async {
    //Set form loading state
    setState(() {
      showLoading = true;
    });

    //Create account
    String? createFeedbackAccount = await createUser();

    //If string isn't null => error
    if (createFeedbackAccount != null) {
      alertDialogBuider(createFeedbackAccount);

      //Cancel show loading form
      setState(() {
        showLoading = false;
      });
    } else {
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
                  valueText: email_controller_register,
                ),
                InputWidget(
                  hintText: 'Password',
                  isPasswordField: true,
                  valueText: password_controller_register,
                ),
                appButton(
                  label: 'Sign in',
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
