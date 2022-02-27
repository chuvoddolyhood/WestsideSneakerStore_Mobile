import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/pages/cart_page.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class ActionBar_Widget extends StatelessWidget {
  final String title;
  final bool hasBack;
  final bool hasBackground;

  const ActionBar_Widget(
      {Key? key,
      required this.hasBack,
      required this.title,
      required this.hasBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('User');

    User? user = FirebaseAuth.instance.currentUser;

    return Container(
      decoration: BoxDecoration(
          gradient: hasBackground
              ? LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1))
              : null),
      padding:
          EdgeInsets.only(top: 56.0, left: 24.0, right: 24.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBack)
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(Icons.arrow_back),
              ),
            ),
          Text(
            title,
            style: appStyles.boldHeading,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0)),
                width: 42.0,
                height: 42.0,
                alignment: Alignment.center,
                child: StreamBuilder<dynamic>(
                  //Dem so luong hang hoa cua User
                  stream: userRef.doc(user!.uid).collection('Cart').snapshots(),
                  builder: (context, snapshot) {
                    int totalProduct = 0;
                    if (snapshot.connectionState == ConnectionState.active) {
                      List documentData = snapshot.data.docs;
                      totalProduct = documentData.length;
                    }
                    return Text(
                      totalProduct.toString(),
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
