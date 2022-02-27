import 'package:flutter/material.dart';
import 'package:westside_sneaker_store/values/text_style.dart';

class Size_Widget extends StatefulWidget {
  final List sizeList;
  const Size_Widget({Key? key, required this.sizeList}) : super(key: key);

  @override
  _Size_WidgetState createState() => _Size_WidgetState();
}

class _Size_WidgetState extends State<Size_Widget> {
  int selectSize = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        children: [
          for (var i = 0; i < widget.sizeList.length; i++)
            InkWell(
              onTap: () {
                setState(() {
                  selectSize = i;
                });
              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                    color: selectSize == i
                        ? Colors.orangeAccent
                        : Color.fromARGB(255, 231, 237, 240),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '${widget.sizeList[i]}',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: selectSize == i ? Colors.white : Colors.black),
                ),
              ),
            )
        ],
      ),
    );
  }
}
