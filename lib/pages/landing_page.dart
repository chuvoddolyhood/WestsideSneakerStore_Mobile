import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
          return Scaffold(
            body: Center(
              child: Text(
                'Connecting',
                style: appStyles.regularHeading,
              ),
            ),
          );
        }
        //Connecting to Firebase - loading
        return Scaffold(
          body: Center(
            child: Text(
              'Initialization App...',
              style: appStyles.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
