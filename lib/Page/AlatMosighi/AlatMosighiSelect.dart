import 'package:flutter/material.dart';

class AlatMosighiSelect extends StatefulWidget {
  String name;
  String picture;
  String description;
  String history;
  AlatMosighiSelect({this.name, this.picture, this.description, this.history});
  @override
  _AlatMosighiSelectState createState() => _AlatMosighiSelectState();
}

class _AlatMosighiSelectState extends State<AlatMosighiSelect> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
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
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      width: myWidth,
                      child: widget.description != null
                          ? ListView(children: [
                              Container(
                                height: myHeight * 0.3,
                                width: myWidth * 0.9,
                                child: Image.asset(
                                  widget.picture,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  widget.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(
                                  "تاریخچه",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  widget.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ])
                          : Center(
                              child: Text(
                              "متاسفانه فعلا اطلاعات در دسترس نیست ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ))))
            ],
          ),
        ),
      ),
    );
  }
}
