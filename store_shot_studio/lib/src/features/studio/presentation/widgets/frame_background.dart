import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class FrameBackground extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final BoxDecoration decoration;

  const FrameBackground({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    this.decoration = const BoxDecoration(
      color: Colors.red,
    ),
  });

  @override
  State<FrameBackground> createState() => _FrameBackgroundState();
}

class _FrameBackgroundState extends State<FrameBackground> {
  double _scale = 1.0;
  double _baseScale = 1.0;

  @override
  void initState() {
    super.initState();
    _scale = _baseScale;
  }

  // Adjust the scale factor based on the user's scroll direction
  void _onScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      final newScale = _scale + (event.scrollDelta.dy / 1000);
      // Ensure that the scale factor stays within reasonable bounds
      setState(() {
        _scale = newScale.clamp(0.1, 10.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _onScroll,
      child: GestureDetector(
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _scale = _baseScale * details.scale;
          });
        },
        onScaleEnd: (ScaleEndDetails details) {
          _baseScale = _scale;
        },
        child: Transform.scale(
          scale: _scale,
          child: Center(
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: widget.decoration,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
