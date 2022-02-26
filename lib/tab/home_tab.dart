import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/widgets/actionBar_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text('home tab'),
        ),
        ActionBar_Widget(
          title: "Home",
          hasBack: false,
        )
      ],
    );
  }
}
