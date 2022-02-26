import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/widgets/actionBar_widget.dart';

class SaveTab extends StatelessWidget {
  const SaveTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Text('save tab')),
        ActionBar_Widget(
          title: "Saved",
          hasBack: false,
        )
      ],
    );
  }
}
