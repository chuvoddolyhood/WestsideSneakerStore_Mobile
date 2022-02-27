import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';
import 'package:westside_sneaker_store/widgets/Size_Widget.dart';
import 'package:westside_sneaker_store/widgets/actionBar_widget.dart';
import 'package:westside_sneaker_store/widgets/imageSwipe_Widget.dart';

class ProductPage extends StatefulWidget {
  final String id_product;
  const ProductPage({Key? key, required this.id_product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

final CollectionReference initialization =
    FirebaseFirestore.instance.collection('Product');

class _ProductPageState extends State<ProductPage> {
  final CollectionReference userRef = FirebaseFirestore.instance
      .collection('User'); //User -> UserID(document) -> Cart -> productID

  //Lay user hien tai dang dang nhap
  User? user = FirebaseAuth.instance.currentUser;

  Future addCart() {
    return userRef
        .doc(user!.uid)
        .collection('Cart')
        .doc(widget.id_product)
        .set({"size": 1});
  }

  final SnackBar snackBar =
      SnackBar(content: Text("Product added to the cart"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder<dynamic>(
            future: initialization.doc(widget.id_product).get(),
            builder: (context, snapshot) {
              //if snapshot has errors
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
                //firebase  doucment data
                Map<String, dynamic> documentData = snapshot.data.data();

                //List of Image
                List imageList = documentData['images'];

                //List of Size
                List sizeList = documentData['size'];

                return ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ImageSwipe(
                      imageList: imageList,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        '${documentData['name']}',
                        style: appStyles.boldHeading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        '\$ ${documentData['price']}',
                        style: appStyles.regularHeading
                            .copyWith(color: Colors.orange, fontSize: 13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        '${documentData['description']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text('Select size', style: appStyles.darkText),
                    ),
                    //Cách gom nhóm layout padding cho giao dien
                    Size_Widget(sizeList: sizeList),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 237, 240),
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.favorite,
                                size: 25,
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await addCart();
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            child: Container(
                              // width: double.infinity,
                              margin: EdgeInsets.only(right: 24),
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'Add to cart',
                                style: appStyles.darkText
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              }

              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }),
        ActionBar_Widget(
          hasBack: true,
          title: '',
          hasBackground: false,
        )
      ]),
    );
  }
}
