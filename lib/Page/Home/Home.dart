import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snamusic/Page/Honarmand/HonarmandHome.dart';
import 'package:snamusic/Page/QR/QRFirst.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/Data/Home.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["category"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Shimmer.fromColors(
        //   baseColor: Colors.black,
        //   highlightColor: Colors.grey[200],
        //   child: Text(
        //     "سنندج شهر خلاق موسیقی",
        //     style: TextStyle(
        //       // color: Colors.orange,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.language,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: myHeight * 0.2,
                    width: myWidth,
                    child: Carousel(
                      images: [
                        Image.asset(
                          "assets/carousel/1.jpg",
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/carousel/2.jpg",
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/carousel/3.jpg",
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/carousel/4.png",
                          fit: BoxFit.fill,
                        ),
                      ],
                      dotSize: 4,
                      dotPosition: DotPosition.bottomRight,
                      dotColor: Colors.grey[300],
                      dotSpacing: 15.0,
                      dotBgColor: Colors.amber.withOpacity(0),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.orange,
                  endIndent: 10.0,
                  indent: 10.0,
                ),
                Expanded(
                  child: Container(
                    width: myWidth,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: HomeItem(
                                  "assets/icon/singer.png", "هنرمندان"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HonarmandHome()));
                              },
                            ),
                            InkWell(
                              child: HomeItem("assets/icon/qr.png", "کیو آر"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            QRViewExample()));
                              },
                            ),
                            InkWell(
                                // onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (BuildContext context) =>
                                //               TestPage()));
                                // },
                                child:
                                    HomeItem("assets/icon/award.png", "مراسم")),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
      floatingActionButton: Container(
        height: myHeight * 0.07,
        width: myWidth * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              color: Colors.grey[500],
              blurRadius: 3.0,
            ),
            BoxShadow(
              offset: Offset(-2, -2),
              color: Colors.white,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "پیشنهادات",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget HomeItem(String image, String title) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      height: myHeight * 0.2,
      width: myWidth * 0.3,
      decoration: BoxDecoration(
        // color: Colors.grey[100],
        gradient: LinearGradient(colors: [
          Colors.grey[100],
          Colors.white,
        ]),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            color: Colors.grey[500],
            blurRadius: 3.0,
          ),
          BoxShadow(
            offset: Offset(-2, -2),
            color: Colors.white,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        // mainAxisAlignment:
        //     MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: myWidth,
            height: myHeight * 0.13,
            child: Center(
              child: Image.asset(
                image,
                height: 70.0,
              ),
            ),
          ),
          Divider(
            color: Colors.orange,
            indent: 10.0,
            endIndent: 10.0,
          ),
          Expanded(
            child: Container(
              width: myWidth,
              // color: Colors.orange[100],
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
