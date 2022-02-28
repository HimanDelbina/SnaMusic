// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:snamusic/Page/Home/Home.dart';
// import 'package:snamusic/animation/Animator.dart';


// class QRSelect extends StatefulWidget {
//   List selectItem = [];
//   String qrText = '';
//   QRSelect({this.selectItem, this.qrText});
//   @override
//   _QRSelectState createState() => _QRSelectState();
// }

// class _QRSelectState extends State<QRSelect> with TickerProviderStateMixin {
//   AudioPlayer advancedPlayer;
//   AudioCache audioCache;

//   List<bool> _flag = [];

//   int playerIndex = 0;

//   List<Animation<double>> _myAnimation = [];
//   List<AnimationController> _controller = [];
//   List<Map<String, Duration>> durationList = [];
//   @override
//   void initState() {
//     super.initState();
//     if (widget.qrText == "zirak") {
//       widget.selectItem = widget.selectItem[0]["items"];
//     } else if (widget.qrText == "khaleghi") {
//       widget.selectItem = widget.selectItem[2]["items"];
//     } else if (widget.qrText == "kamandi") {
//       widget.selectItem = widget.selectItem[1]["items"];
//     }
//     durationList = List.generate(
//         widget.selectItem.length,
//         (index) => {
//               "duration": Duration(),
//               "position": Duration(),
//             });
//     for (var i = 0; i < widget.selectItem.length; i++) {
//       _flag.add(true);
//     }
//     initPlayer();

//     for (var i = 0; i < widget.selectItem.length; i++) {
//       _controller.add(AnimationController(
//         vsync: this,
//         duration: Duration(milliseconds: 200),
//       ));

//       _myAnimation
//           .add(CurvedAnimation(curve: Curves.linear, parent: _controller[i]));
//     }
//   }

//   @override
//   void dispose() {
//     advancedPlayer.stop();
//     super.dispose();
//   }

//   void initPlayer() {
//     advancedPlayer = new AudioPlayer();
//     audioCache = new AudioCache(fixedPlayer: advancedPlayer);

//     advancedPlayer.durationHandler = (d) => setState(() {
//           // _duration = d;
//           (durationList[playerIndex])["duration"] = d;
//         });

//     advancedPlayer.positionHandler = (p) => setState(() {
//           // _position = p;
//           (durationList[playerIndex])["position"] = p;
//         });
//   }

//   String localFilePath;

//   Widget _tab(List<Widget> children) {
//     return Center(
//       child: Container(
//         // padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: children
//               .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
//               .toList(),
//         ),
//       ),
//     );
//   }

//   Widget _btn(int index, var icon, VoidCallback onPressed, Color color) {
//     return ButtonTheme(
//         minWidth: 48.0,
//         child: InkWell(
//             onTap: onPressed,
//             child: Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Colors.grey[200],
//                   Colors.white,
//                 ]),
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(2, 2),
//                     color: Colors.grey[500],
//                     blurRadius: 3.0,
//                   ),
//                   BoxShadow(
//                     offset: Offset(-2, -2),
//                     color: Colors.white,
//                     blurRadius: 3.0,
//                   ),
//                 ],
//               ),
//               child: Center(
//                 child: AnimatedIcon(
//                   progress: _myAnimation[index],
//                   icon: icon,
//                   color: color,
//                 ),
//               ),
//             )));
//   }

//   void seekToSecond(int second) {
//     Duration newDuration = Duration(seconds: second);

//     advancedPlayer.seek(newDuration);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double myHeight = MediaQuery.of(context).size.height;
//     double myWidth = MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) => Home()));
//         advancedPlayer.stop();
//       },
//       child: DefaultTabController(
//         length: 1,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: SafeArea(
//               // child: Container(),
//               child: Container(
//                   height: myHeight,
//                   width: myWidth,
//                   child: widget.selectItem.length != null
//                       ? ListView.builder(
//                           itemCount: widget.selectItem.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: WidgetANimator(
//                                 Center(
//                                   child: Container(
//                                     height: myHeight * 0.105,
//                                     width: myWidth * 0.9,
//                                     decoration: BoxDecoration(
//                                       // color: Colors.amber,
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         SliderTheme(
//                                           data: SliderThemeData(
//                                             // activeTrackColor: Colors.orange,
//                                             trackHeight: myHeight * 0.105,

//                                             trackShape:
//                                                 RectangularSliderTrackShape(),
//                                           ),
//                                           child: Slider(
//                                               value: durationList[index]
//                                                       ["position"]
//                                                   .inSeconds
//                                                   .toDouble(),
//                                               min: 0.0,
//                                               max: durationList[index]
//                                                       ["duration"]
//                                                   .inSeconds
//                                                   .toDouble(),
//                                               activeColor: Colors.orange,
//                                               inactiveColor: Colors.orange[100],
//                                               // autofocus: true,
//                                               onChanged: (double value) {
//                                                 setState(() {
//                                                   seekToSecond(value.toInt());
//                                                   value = value;
//                                                 });
//                                               }),
//                                         ),
//                                         Container(
//                                           height: myHeight * 0.1,
//                                           width: myWidth * 0.9,
//                                           decoration: BoxDecoration(
//                                             gradient: LinearGradient(colors: [
//                                               Colors.grey[200],
//                                               Colors.white,
//                                             ]),
//                                             // shape: BoxShape.circle,
//                                             borderRadius:
//                                                 BorderRadius.circular(10.0),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 offset: Offset(2, 2),
//                                                 color: Colors.grey[500],
//                                                 blurRadius: 3.0,
//                                               ),
//                                               BoxShadow(
//                                                 offset: Offset(-2, -2),
//                                                 color: Colors.white,
//                                                 blurRadius: 3.0,
//                                               ),
//                                             ],
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 height: myHeight,
//                                                 width: myWidth * 0.2,
//                                                 child: Center(
//                                                   child: _btn(
//                                                     index,
//                                                     AnimatedIcons.play_pause,
//                                                     () {
//                                                       playerIndex = index;
//                                                       if (_flag[index]) {
//                                                         _controller[index]
//                                                             .forward();
//                                                         audioCache.play(widget
//                                                                 .selectItem[
//                                                             index]["music"]);
//                                                       } else {
//                                                         _controller[index]
//                                                             .reverse();
//                                                         advancedPlayer.pause();
//                                                       }
//                                                       setState(() {
//                                                         _flag[index] =
//                                                             !_flag[index];
//                                                       });
//                                                     },
//                                                     Colors.black,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Container(
//                                                   height: myHeight,
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         15.0),
//                                                             child: Text(
//                                                               widget.selectItem[
//                                                                       index]
//                                                                   ["name"],
//                                                               style: TextStyle(
//                                                                 color: Colors
//                                                                     .orange,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         30.0),
//                                                             child: Text(
//                                                               widget.selectItem[
//                                                                       index]
//                                                                   ["musicName"],
//                                                               style: TextStyle(
//                                                                 color:
//                                                                     Colors.grey,
//                                                                 // fontWeight: FontWeight.bold,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Divider(
//                                                         color: Colors.orange,
//                                                       ),
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           InkWell(
//                                                             onTap: () {
//                                                               if (!_flag[
//                                                                   index]) {
//                                                                 advancedPlayer
//                                                                     .stop();
//                                                                 _controller[
//                                                                         index]
//                                                                     .reverse();
//                                                                 _flag[index] =
//                                                                     !_flag[
//                                                                         index];
//                                                               }
//                                                             },
//                                                             child: Icon(
//                                                               Icons.stop,
//                                                               color:
//                                                                   Colors.black,
//                                                             ),
//                                                           ),
//                                                           // InkWell(
//                                                           //   onTap: () {},
//                                                           //   child: Icon(
//                                                           //     Icons.fullscreen,
//                                                           //   ),
//                                                           // ),
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         10.0),
//                                                             child: Icon(
//                                                               Icons
//                                                                   .favorite_border,
//                                                               color: Colors.red,
//                                                             ),
//                                                           ),
//                                                           // Slider(
//                                                           //     value: durationList[
//                                                           //                 index]
//                                                           //             ["position"]
//                                                           //         .inSeconds
//                                                           //         .toDouble(),
//                                                           //     min: 0.0,
//                                                           //     max: durationList[
//                                                           //                 index]
//                                                           //             ["duration"]
//                                                           //         .inSeconds
//                                                           //         .toDouble(),
//                                                           //     activeColor:
//                                                           //         Colors.orange,
//                                                           //     inactiveColor:
//                                                           //         Colors.orange[
//                                                           //             100],
//                                                           //     autofocus: true,
//                                                           //     onChanged:
//                                                           //         (double value) {
//                                                           //       setState(() {
//                                                           //         seekToSecond(value
//                                                           //             .toInt());
//                                                           //         value = value;
//                                                           //       });
//                                                           //     }),

//                                                           // Row(
//                                                           //   children: [
//                                                           //     Text(
//                                                           //         "${durationList[index]["position"].inMinutes}:${durationList[index]["position"].inSeconds.remainder(60)}"),
//                                                           //     Slider(
//                                                           //         value: durationList[
//                                                           //                     index]
//                                                           //                 ["position"]
//                                                           //             .inSeconds
//                                                           //             .toDouble(),
//                                                           //         min: 0.0,
//                                                           //         max: durationList[
//                                                           //                     index]
//                                                           //                 ["duration"]
//                                                           //             .inSeconds
//                                                           //             .toDouble(),
//                                                           //         activeColor:
//                                                           //             Colors.orange,
//                                                           //         inactiveColor: Colors
//                                                           //             .orange[100],
//                                                           //         autofocus: true,
//                                                           //         onChanged:
//                                                           //             (double value) {
//                                                           //           setState(() {
//                                                           //             seekToSecond(value
//                                                           //                 .toInt());
//                                                           //             value = value;
//                                                           //           });
//                                                           //         }),
//                                                           //     Text(
//                                                           //         "${durationList[index]["duration"].inMinutes}:${durationList[index]["duration"].inSeconds.remainder(60)}"),
//                                                           //   ],
//                                                           // )
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           })
//                       : Center(
//                           child: Text("لیست خالی است"),
//                         ))),
//         ),
//       ),
//     );
//   }
// }
