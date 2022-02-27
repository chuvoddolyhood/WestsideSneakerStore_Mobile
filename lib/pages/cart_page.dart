import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/pages/product_page.dart';
import 'package:westside_sneaker_store/values/text_style.dart';
import 'package:westside_sneaker_store/widgets/actionBar_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //Lay user hien tai dang dang nhap
  User? user = FirebaseAuth.instance.currentUser;

  // final CollectionReference userRef =
  //     FirebaseFirestore.instance.collection('User');
  final CollectionReference productRef =
      FirebaseFirestore.instance.collection('Product');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('User')
              .doc(user!.uid)
              .collection('Cart')
              .get(),
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

            //connect
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                padding: EdgeInsets.only(top: 108.0, bottom: 70),
                children: snapshot.data!.docs.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductPage(id_product: e.id)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),

                      margin: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      // child: Text('Name:${e['size'][0]}'),
                      child: Container(
                        child: Text("${e.id}"),
                      ),
                    ),
                  );
                }).toList(),
              );
            }

            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        ActionBar_Widget(hasBack: true, title: 'Cart', hasBackground: true)
      ]),
    );
  }
}
