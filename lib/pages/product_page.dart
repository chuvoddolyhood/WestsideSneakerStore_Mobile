import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';
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