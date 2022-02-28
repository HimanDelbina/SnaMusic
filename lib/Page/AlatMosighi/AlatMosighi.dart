import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snamusic/Bloc/ShowItemBloc.dart';
import 'package:snamusic/animation/Animator.dart';

import '../../PageShow.dart';
import 'AlatMosighiSelect.dart';


class AlatMosighi extends StatefulWidget {
  List selectItem = [];
  AlatMosighi({this.selectItem});
  @override
  _AlatMosighiState createState() => _AlatMosighiState();
}

class _AlatMosighiState extends State<AlatMosighi> {
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
                              color: itemShow.listViewColorAlatMosighi,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              itemShow.gridShow();
                            },
                            child: Image.asset(
                              "assets/icon/grid.png",
                              height: 20.0,
                              color: itemShow.gridViewColorAlatMosighi,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: myHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: myWidth,
                    child: widget.selectItem.length > 0 && itemShow.isShowGrid
                        ? GridView.builder(
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: widget.selectItem.length,
                            itemBuilder: (context, index) {
                              return WidgetANimator(
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  AlatMosighiSelect(
                                                    name:
                                                        widget.selectItem[index]
                                                            ["name"],
                                                    picture:
                                                        widget.selectItem[index]
                                                            ["picture"],
                                                    description:
                                                        widget.selectItem[index]
                                                            ["description"],
                                                    history:
                                                        widget.selectItem[index]
                                                            ["history"],
                                                  )));
                                    },
                                    child: Container(
                                      height: myHeight * 0.2,
                                      width: myWidth * 0.3,
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[100],
                                        gradient: LinearGradient(colors: [
                                          Colors.grey[200],
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            widget.selectItem[index]["image"],
                                            height: 50.0,
                                          ),
                                          Divider(
                                            color: Colors.orange,
                                            endIndent: 10.0,
                                            indent: 10.0,
                                          ),
                                          Text(
                                            widget.selectItem[index]["name"],
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : ListView.builder(
                            itemCount: widget.selectItem.length,
                            itemBuilder: (context, index) {
                              return WidgetANimator(
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: myHeight * 0.1,
                                    width: myWidth * 0.9,
                                    decoration: BoxDecoration(
                                      // color: Colors.grey[100],
                                      gradient: LinearGradient(colors: [
                                        Colors.grey[200],
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
                                    child: Center(
                                      child: ListTile(
                                        leading: Text(
                                          widget.selectItem[index]["name"],
                                          style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        trailing: Image.asset(
                                          widget.selectItem[index]["image"],
                                          height: 40.0,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlatMosighiSelect(
                                                            name: widget
                                                                    .selectItem[
                                                                index]["name"],
                                                            picture: widget
                                                                    .selectItem[
                                                                index]["picture"],
                                                            description: widget
                                                                        .selectItem[
                                                                    index]
                                                                ["description"],
                                                            history: widget
                                                                    .selectItem[
                                                                index]["history"],
                                                          )));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
              ),
              Container(
                height: myHeight * 0.1,
                width: myWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PageShow()));
                        },
                        child: Container(
                          height: myHeight * 0.07,
                          width: myWidth * 0.14,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.grey[100],
                              Colors.white,
                            ]),
                            shape: BoxShape.circle,
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
                            child: Icon(
                              Icons.home,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
