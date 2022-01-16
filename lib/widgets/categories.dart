import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<String> items;

  Categories({Key key, @required this.items, }) : super(key: key);

  //   final PageController _pageController = PageController(
  //   initialPage: 1,
  //   viewportFraction: 0.3
  // );

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int i)=>
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFF00BAFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const <BoxShadow>[
             BoxShadow(color: Colors.black12,blurRadius: 5.0,offset: Offset(0,2.0),spreadRadius: 2)
          ]
        ),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: Center(child: Text(items[i], style: TextStyle(color: Colors.white, fontSize:17, fontWeight: FontWeight.bold))),
      ),
    );
  }
}