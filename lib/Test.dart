import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' show pi;

import 'Bloc/DataBloc.dart';
import 'Bloc/ShowItemBloc.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    final DataBloc data = Provider.of<DataBloc>(context);
    final ItemShow show = Provider.of<ItemShow>(context);
    data.readJson();
    return Scaffold(
      backgroundColor: Colors.amber[200],
      body: SafeArea(
        child: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: PlayButton(
                    playIcon: Icon(
                      Icons.play_arrow,
                      size: 90.0,
                      color: Colors.black,
                    ),
                    pauseIcon: Icon(
                      Icons.pause,
                      size: 90.0,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                // Container(
                //   height: 200,
                //   width: 200,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.white,
                //   ),
                //   child: Stack(
                //     children: [
                //       Center(
                //         child: Icon(
                //           Icons.play_arrow,
                //           size: 90.0,
                //         ),
                //       ),
                //       Center(
                //         child: SleekCircularSlider(
                //           min: 0,
                //           max: 1000,
                //           initialValue: 426,
                //           onChange: (double value) {
                //             // callback providing a value while its being changed (with a pan gesture)
                //           },
                //           onChangeStart: (double startValue) {
                //             // callback providing a starting value (when a pan gesture starts)
                //           },
                //           onChangeEnd: (double endValue) {
                //             // ucallback providing an ending value (when a pan gesture ends)
                //           },
                //           innerWidget: (double value) {
                //             // use your custom widget inside the slider (gets a slider value from the callback)
                //           },
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            )),
      ),
    );
  }
}

class PlayButton extends StatefulWidget {
  bool initialisPlaying;
  final Icon pauseIcon;
  final Icon playIcon;
  final VoidCallback onPressed;
  PlayButton({
    this.initialisPlaying = false,
    this.pauseIcon = const Icon(Icons.pause),
    this.playIcon = const Icon(Icons.play_arrow),
    @required this.onPressed,
  }) : assert(onPressed != null);
  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  static const _kToggleDuration = Duration(
    milliseconds: 300,
  );
  static const _kRotationDuration = Duration(
    seconds: 5,
  );
  bool isPlaying;

  AnimationController _rotationController;
  AnimationController _scaleController;

  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => !_scaleController.isDismissed;

  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = widget.initialisPlaying;
    _rotationController =
        AnimationController(vsync: this, duration: _kRotationDuration)
          ..addListener(() => setState(_updateRotation))
          ..repeat();
    _scaleController =
        AnimationController(vsync: this, duration: _kToggleDuration)
          ..addListener(() => setState(_updateScale));
    super.initState();
  }

  void _onToggle() {
    setState(() => isPlaying = !isPlaying);

    if (_scaleController.isCompleted) {
      _scaleController.reverse();
    } else {
      _scaleController.forward();
    }

    widget.onPressed();
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child: IconButton(
        icon: isPlaying ? widget.pauseIcon : widget.playIcon,
        onPressed: _onToggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 48.0, minWidth: 48.0),
      child: Stack(
        children: [
          if (_showWaves) ...[
            Blob(
              color: Colors.red,
              scale: _scale,
              rotation: _rotation,
            ),
            Blob(
              color: Colors.deepOrange,
              scale: _scale,
              rotation: _rotation * 2 - 30,
            ),
            Blob(
              color: Colors.orange,
              scale: _scale,
              rotation: _rotation * 3 - 45,
            ),
          ],
          Container(
            constraints: BoxConstraints.expand(),
            child: AnimatedSwitcher(
              child: _buildIcon(isPlaying),
              duration: _kToggleDuration,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}

class Blob extends StatelessWidget {
  final double rotation;
  final double scale;
  final Color color;

  const Blob({this.rotation = 0, this.scale = 1, this.color})
      : assert(color != null);
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(240),
                topLeft: Radius.circular(150),
                bottomLeft: Radius.circular(220),
                bottomRight: Radius.circular(180),
              )),
        ),
      ),
    );
  }
}
