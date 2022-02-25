import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/pages/home_page.dart';
import 'package:westside_sneaker_store/pages/login_page.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        //if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: appStyles.regularHeading,
              ),
            ),
          );
        }

        //Firebase app is running - successful connect
        if (snapshot.connectionState == ConnectionState.done) {
          //Streambuider can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              //if streamSnapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Error: ${streamSnapshot.error}',
                      style: appStyles.regularHeading,
                    ),
                  ),
                );
              }

              //Connect state active - user logined this app
              if (streamSnapshot.connectionState == ConnectionState.active) {
                //get user
                FirebaseAuth.instance.authStateChanges().listen((User? user) {
                  if (user == null) {
                    // print('User is currently signed out!');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    // print('User is signed in!');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                });
              }

              //Checking the auth state - Loading - Checking Authentication...
              return Scaffold(
                body: Center(
                  child: Text(
                    'Loading...',
                    style: appStyles.regularHeading,
                  ),
                ),
              );
            },
          );
        }
        //Connecting to Firebase - loading - Initialization App
        return Scaffold(
          body: Center(
            child: Text(
              'Loading...',
              style: appStyles.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
