// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' show pi;

// import 'package:snamusic/animation/Animator.dart';

// class SelectSinger extends StatefulWidget {
//   List selectItem = [];
//   String nameSinger;
//   SelectSinger({this.selectItem, this.nameSinger});
//   @override
//   _SelectSingerState createState() => _SelectSingerState();
// }

// class _SelectSingerState extends State<SelectSinger>
//     with TickerProviderStateMixin {
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
//     durationList = List.generate(
//         widget.selectItem.length,
//         (index) => {
//               "duration": Duration(),
//               "position": Duration(),
//             });
//     for (var i = 0; i < widget.selectItem.length; i++) {
//       _flag.add(true);
//     }
//     // _flag = List.generate(widget.selectItem.length, (index) => {true});
//     initPlayer();
//     // setDuratios();
//     // durationList[0]["position"] = Duration(milliseconds: 500);
//     // durationList[0]["duration"] = Duration(milliseconds: 1000);
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

//   // Widget slider() {
//   //   return Slider(
//   //       value: _position.inSeconds.toDouble(),
//   //       min: 0.0,
//   //       max: _duration.inSeconds.toDouble(),
//   //       activeColor: Colors.orange,
//   //       inactiveColor: Colors.orange[100],
//   //       onChanged: (double value) {
//   //         setState(() {
//   //           seekToSecond(value.toInt());
//   //           value = value;
//   //         });
//   //       });
//   // }

//   // Widget localAsset(String music) {
//   //   // final HoshBloc hoshBloc = Provider.of<HoshBloc>(context);
//   //   return _tab([
//   //     Row(
//   //       mainAxisAlignment: MainAxisAlignment.end,
//   //       children: [
//   //         // _btn(Icons.pause, () => advancedPlayer.pause()),
//   //         _btn(Icons.play_arrow, () => audioCache.play(music), iconColor),
//   //         // _btn(Icons.stop, () => advancedPlayer.stop()),
//   //       ],
//   //     ),
//   //     // slider(),
//   //   ]);
//   // }

//   void seekToSecond(int second) {
//     Duration newDuration = Duration(seconds: second);

//     advancedPlayer.seek(newDuration);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double myHeight = MediaQuery.of(context).size.height;
//     double myWidth = MediaQuery.of(context).size.width;
//     return DefaultTabController(
//       length: 1,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//             // child: Container(),
//             child: Container(
//                 height: myHeight,
//                 width: myWidth,
//                 child: Column(
//                   children: [
//                     Container(
//                       height: myHeight * 0.06,
//                       width: myWidth,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Text(
//                               widget.nameSinger,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.orange,
//                               ),
//                             ),
//                           )
//                           // Expanded(child: Container()),
//                           // Container(
//                           //   height: myHeight,
//                           //   width: myWidth * 0.2,
//                           //   // color: Colors.amber,
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           // itemShow.listShow();
//                           //         },
//                           //         child: Image.asset(
//                           //           "assets/icon/list.png",
//                           //           height: 23.0,
//                           //           // color: itemShow.listViewColor,
//                           //         ),
//                           //       ),
//                           //       InkWell(
//                           //         onTap: () {
//                           //           // itemShow.gridShow();
//                           //         },
//                           //         child: Image.asset(
//                           //           "assets/icon/grid.png",
//                           //           height: 20.0,
//                           //           // color: itemShow.gridViewColor,
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // Container(
//                           //   height: myHeight,
//                           //   width: myWidth * 0.5,
//                           //   child: Center(
//                           //     child: Container(
//                           //       height: myHeight * 0.06,
//                           //       width: myWidth * 0.4,
//                           //       decoration: BoxDecoration(
//                           //         gradient: LinearGradient(colors: [
//                           //           Colors.grey[200],
//                           //           Colors.white,
//                           //         ]),
//                           //         // shape: BoxShape.circle,
//                           //         borderRadius: BorderRadius.circular(10.0),
//                           //         boxShadow: [
//                           //           BoxShadow(
//                           //             offset: Offset(2, 2),
//                           //             color: Colors.grey[500],
//                           //             blurRadius: 3.0,
//                           //           ),
//                           //           BoxShadow(
//                           //             offset: Offset(-2, -2),
//                           //             color: Colors.white,
//                           //             blurRadius: 3.0,
//                           //           ),
//                           //         ],
//                           //       ),
//                           //       child: Center(
//                           //         child: Text(
//                           //           widget.nameSinger,
//                           //           style: TextStyle(
//                           //             fontWeight: FontWeight.bold,
//                           //             color: Colors.orange,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ),
//                           //   ),
//                           // )
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
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
//                                                     child: SizedBox(
//                                                   height: 50,
//                                                   width: 50,
//                                                   child: PlayButton(
//                                                     playIcon: Icon(
//                                                       Icons.play_arrow,
//                                                       size: 30.0,
//                                                       color: Colors.black,
//                                                     ),
//                                                     pauseIcon: Icon(
//                                                       Icons.pause,
//                                                       size: 30.0,
//                                                       color: Colors.black,
//                                                     ),
//                                                     onPressed: () {
//                                                       playerIndex = index;
//                                                       if (_flag[index]) {
//                                                         // _controller[index]
//                                                         //     .forward();
//                                                         audioCache.play(widget
//                                                                 .selectItem[
//                                                             index]["music"]);
//                                                       } else {
//                                                         // _controller[index]
//                                                         //     .reverse();
//                                                         advancedPlayer.pause();
//                                                       }
//                                                       _flag[index] =
//                                                           !_flag[index];
//                                                       // setState(() {
//                                                       //   _flag[index] =
//                                                       //       !_flag[index];
//                                                       // });
//                                                     },
//                                                   ),
//                                                 )
//                                                     // child: _btn(
//                                                     //   index,
//                                                     //   AnimatedIcons.play_pause,
//                                                     //   () {
//                                                     //     playerIndex = index;
//                                                     //     if (_flag[index]) {
//                                                     //       _controller[index]
//                                                     //           .forward();
//                                                     //       audioCache.play(widget
//                                                     //               .selectItem[
//                                                     //           index]["music"]);
//                                                     //     } else {
//                                                     //       _controller[index]
//                                                     //           .reverse();
//                                                     //       advancedPlayer.pause();
//                                                     //     }
//                                                     //     setState(() {
//                                                     //       _flag[index] =
//                                                     //           !_flag[index];
//                                                     //     });
//                                                     //   },
//                                                     //   Colors.black,
//                                                     // ),
//                                                     ),
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
//                                                           // Padding(
//                                                           //   padding:
//                                                           //       const EdgeInsets
//                                                           //               .symmetric(
//                                                           //           horizontal:
//                                                           //               15.0),
//                                                           //   child: Text(
//                                                           //     widget.selectItem[
//                                                           //             index]
//                                                           //         ["name"],
//                                                           //     style: TextStyle(
//                                                           //       color: Colors
//                                                           //           .orange,
//                                                           //       fontWeight:
//                                                           //           FontWeight
//                                                           //               .bold,
//                                                           //     ),
//                                                           //   ),
//                                                           // ),
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
//                                                         endIndent: 15.0,
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
//                                                           InkWell(
//                                                             onTap: () {},
//                                                             child: Icon(
//                                                               Icons.fullscreen,
//                                                             ),
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               Padding(
//                                                                 padding: const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         10.0),
//                                                                 child: Icon(
//                                                                   Icons
//                                                                       .file_download,
//                                                                   color: Colors
//                                                                       .grey,
//                                                                 ),
//                                                               ),
//                                                               Padding(
//                                                                 padding: const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         10.0),
//                                                                 child: Icon(
//                                                                   Icons
//                                                                       .favorite_border,
//                                                                   color: Colors
//                                                                       .red,
//                                                                 ),
//                                                               ),
//                                                             ],
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
//                           }),
//                     ),
//                   ],
//                 ))),
//       ),
//     );
//   }
// }

// class PlayButton extends StatefulWidget {
//   bool initialisPlaying;
//   final Icon pauseIcon;
//   final Icon playIcon;
//   final VoidCallback onPressed;
//   PlayButton({
//     this.initialisPlaying = false,
//     this.pauseIcon = const Icon(Icons.pause),
//     this.playIcon = const Icon(Icons.play_arrow),
//     @required this.onPressed,
//   }) : assert(onPressed != null);
//   @override
//   _PlayButtonState createState() => _PlayButtonState();
// }

// class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
//   static const _kToggleDuration = Duration(
//     milliseconds: 300,
//   );
//   static const _kRotationDuration = Duration(
//     seconds: 5,
//   );
//   bool isPlaying;

//   AnimationController _rotationController;
//   AnimationController _scaleController;

//   double _rotation = 0;
//   double _scale = 0.85;

//   bool get _showWaves => !_scaleController.isDismissed;

//   void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
//   void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

//   @override
//   void initState() {
//     isPlaying = widget.initialisPlaying;
//     _rotationController =
//         AnimationController(vsync: this, duration: _kRotationDuration)
//           ..addListener(() => setState(_updateRotation))
//           ..repeat();
//     _scaleController =
//         AnimationController(vsync: this, duration: _kToggleDuration)
//           ..addListener(() => setState(_updateScale));
//     super.initState();
//   }

//   void _onToggle() {
//     setState(() => isPlaying = !isPlaying);

//     if (_scaleController.isCompleted) {
//       _scaleController.reverse();
//     } else {
//       _scaleController.forward();
//     }

//     widget.onPressed();
//   }

//   Widget _buildIcon(bool isPlaying) {
//     return SizedBox.expand(
//       key: ValueKey<bool>(isPlaying),
//       child: IconButton(
//         icon: isPlaying ? widget.pauseIcon : widget.playIcon,
//         onPressed: _onToggle,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(minHeight: 40.0, minWidth: 40.0),
//       child: Stack(
//         children: [
//           if (_showWaves) ...[
//             Blob(
//               color: Colors.red,
//               scale: _scale,
//               rotation: _rotation,
//             ),
//             Blob(
//               color: Colors.deepOrange,
//               scale: _scale,
//               rotation: _rotation * 2 - 30,
//             ),
//             Blob(
//               color: Colors.orange,
//               scale: _scale,
//               rotation: _rotation * 3 - 45,
//             ),
//           ],
//           Container(
//             constraints: BoxConstraints.expand(),
//             child: AnimatedSwitcher(
//               child: _buildIcon(isPlaying),
//               duration: _kToggleDuration,
//             ),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 Colors.grey[200],
//                 Colors.white,
//               ]),
//               shape: BoxShape.circle,
//               // borderRadius: BorderRadius.circular(10.0),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(2, 2),
//                   color: Colors.grey[500],
//                   blurRadius: 3.0,
//                 ),
//                 BoxShadow(
//                   offset: Offset(-2, -2),
//                   color: Colors.white,
//                   blurRadius: 3.0,
//                 ),
//               ],
//             ),
//             // decoration: BoxDecoration(
//             //   shape: BoxShape.circle,
//             //   color: Colors.white,
//             // ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _scaleController.dispose();
//     _rotationController.dispose();
//     super.dispose();
//   }
// }

// class Blob extends StatelessWidget {
//   final double rotation;
//   final double scale;
//   final Color color;

//   const Blob({this.rotation = 0, this.scale = 1, this.color})
//       : assert(color != null);
//   @override
//   Widget build(BuildContext context) {
//     return Transform.scale(
//       scale: scale,
//       child: Transform.rotate(
//         angle: rotation,
//         child: Container(
//           decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(240),
//                 topLeft: Radius.circular(150),
//                 bottomLeft: Radius.circular(220),
//                 bottomRight: Radius.circular(180),
//               )),
//         ),
//       ),
//     );
//   }
// }
