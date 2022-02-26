import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';
import 'package:westside_sneaker_store/widgets/actionBar_widget.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference initialization =
      FirebaseFirestore.instance.collection('Product');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<QuerySnapshot>(
          future: initialization.get(),
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
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    height: 350.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    // child: Text('Name:${e['size'][0]}'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        '${e['images'][0]}',
                        fit: BoxFit.cover,
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
        ActionBar_Widget(
          title: "Home",
          hasBack: false,
        )
      ],
    );
  }
}
