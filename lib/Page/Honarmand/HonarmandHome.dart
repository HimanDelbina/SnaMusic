import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snamusic/Bloc/ShowItemBloc.dart';
import 'package:snamusic/Page/AlatMosighi/AlatMosighi.dart';
import 'package:snamusic/Page/Dastgah/Dastgah.dart';
import 'package:snamusic/Page/Nava/NavaHome.dart';
import 'package:snamusic/Page/Shear/ShearHome.dart';
import 'package:snamusic/animation/Animator.dart';

import 'SelectItem.dart';

class HonarmandHome extends StatefulWidget {
  @override
  _HonarmandHomeState createState() => _HonarmandHomeState();
}

class _HonarmandHomeState extends State<HonarmandHome> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/Data/Honarmand.json');
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
    final ItemShow itemShow = Provider.of<ItemShow>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Container(
                height: myHeight * 0.07,
                width: myWidth,
                child: Row(
                  children: [
                    Container(
                      height: myHeight,
                      width: myWidth * 0.2,
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              itemShow.listShow();
                            },
                            child: Image.asset(
                              "assets/icon/list.png",
                              height: 23.0,
                              color: itemShow.listViewColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              itemShow.gridShow();
                            },
                            child: Image.asset(
                              "assets/icon/grid.png",
                              height: 20.0,
                              color: itemShow.gridViewColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: myHeight,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: myWidth,
                    child: _items.length > 0 && itemShow.isShowGrid
                        ? GridView.builder(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    // crossAxisCount: 3,
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              return WidgetANimator(
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: InkWell(
                                    onTap: () {
                                      if (_items[index]["id"] == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SelectItem(
                                                          selectItem:
                                                              _items[index]
                                                                  ["items"],
                                                        )));
                                      } else if (_items[index]["id"] == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        ShearHome(
                                                          selectItem:
                                                              _items[index]
                                                                  ["items"],
                                                        )));
                                      } else if (_items[index]["id"] == 6) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        AlatMosighi(
                                                          selectItem:
                                                              _items[index]
                                                                  ["items"],
                                                        )));
                                      } else if (_items[index]["id"] == 3) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        NavaHome(
                                                          selectItem:
                                                              _items[index]
                                                                  ["items"],
                                                        )));
                                      } else if (_items[index]["id"] == 5) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DastgahHome(
                                                          selectItem:
                                                              _items[index]
                                                                  ["items"],
                                                        )));
                                      }
                                    },
                                    child: Container(
                                      height: myHeight * 0.15,
                                      width: myWidth * 0.3,
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[100],
                                        gradient: LinearGradient(colors: [
                                          Colors.grey[100],
                                          Colors.white,
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            _items[index]["image"],
                                            height: 50.0,
                                          ),
                                          Divider(
                                            color: Colors.orange,
                                            indent: 10.0,
                                            endIndent: 10.0,
                                          ),
                                          Text(
                                            _items[index]["name"],
                                            style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemCount: _items.length,
                            itemBuilder: (context, index) {
                              return WidgetANimator(
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
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
                                    child: ListTile(
                                      leading: Text(
                                        _items[index]["name"],
                                      ),
                                      trailing: Image.asset(
                                        _items[index]["image"],
                                        height: 40.0,
                                      ),
                                      onTap: () {
                                        if (_items[index]["id"] == 1) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          SelectItem(
                                                            selectItem:
                                                                _items[index]
                                                                    ["items"],
                                                          )));
                                        } else if (_items[index]["id"] == 2) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ShearHome(
                                                            selectItem:
                                                                _items[index]
                                                                    ["items"],
                                                          )));
                                        } else if (_items[index]["id"] == 6) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlatMosighi(
                                                            selectItem:
                                                                _items[index]
                                                                    ["items"],
                                                          )));
                                        } else if (_items[index]["id"] == 3) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          NavaHome(
                                                            selectItem:
                                                                _items[index]
                                                                    ["items"],
                                                          )));
                                        } else if (_items[index]["id"] == 5) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          DastgahHome(
                                                            selectItem:
                                                                _items[index]
                                                                    ["items"],
                                                          )));
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            })),
              ),
              Container(
                height: myHeight * 0.1,
                width: myWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
