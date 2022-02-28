import 'package:flutter/material.dart';

class Favorate extends StatefulWidget {
  @override
  _FavorateState createState() => _FavorateState();
}

class _FavorateState extends State<Favorate> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        child: Center(
          child: Text("Favorate"),
        ),
      ),
    );
  }
}
