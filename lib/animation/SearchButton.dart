import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAnimation extends StatefulWidget {
  String type = "";
  // Function f;

  SearchAnimation({@required this.type});

  @override
  _SearchAnimationState createState() => _SearchAnimationState();
}

int toggle = 0;

class _SearchAnimationState extends State<SearchAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _con;
  TextEditingController _textEditingController;
  var _icon = Icon(Icons.search, color: Colors.red);
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeBloc theme = Provider.of<ThemeBloc>(context);
    // final GetPlants getPlant = Provider.of<GetPlants>(context);
    return Container(
      child: Center(
        child: Container(
          height: 100,
          width: 250.0,
          alignment: Alignment(-1.0, 0.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 375),
            height: 45.0,
            width: (toggle == 0) ? 45.0 : 250.0,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey[200],
                Colors.white,
              ]),
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(30.0),
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
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 375),
                  top: 6.0,
                  right: 7.0,
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xffF2F3F7),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: AnimatedBuilder(
                        child: Icon(
                          Icons.mic,
                          size: 20.0,
                        ),
                        builder: (context, widget) {
                          return Transform.rotate(
                            angle: _con.value * 2.0 * pi,
                            child: widget,
                          );
                        },
                        animation: _con,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 375),
                  left: (toggle == 0) ? 20.0 : 33.0,
                  curve: Curves.easeOut,
                  top: 11.0,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      height: 23.0,
                      width: 180.0,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            if (widget.type == "singer") {
                              // getPlant.getPersianPlantsFilter(value);
                            }
                          });
                        },
                        cursorRadius: Radius.circular(10.0),
                        cursorWidth: 2.0,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "جستجو....",
                          // labelStyle: TextStyle()
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    splashRadius: 19.0,
                    icon: _icon,
                    onPressed: () {
                      setState(
                        () {
                          if (toggle == 0) {
                            toggle = 1;
                            _con.forward();
                            _icon = Icon(
                              Icons.arrow_forward,
                              color: Colors.red,
                            );
                          } else {
                            toggle = 0;
                            _textEditingController.clear();
                            _con.reverse();
                            _icon = Icon(
                              Icons.search,
                              color: Colors.red,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
