import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  final List imageList;
  const ImageSwipe({Key? key, required this.imageList}) : super(key: key);

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  int selectPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // child: Image.network('${documentData['images'][0]}'),
      child: Stack(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  selectPage = index;
                });
              },
              children: [
                for (var i = 0; i < widget.imageList.length; i++)
                  Container(
                    child: Image.network(
                      '${widget.imageList[i]}',
                      fit: BoxFit.cover,
                    ),
                  )
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < widget.imageList.length; i++)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: selectPage == i ? 35 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(24)),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
