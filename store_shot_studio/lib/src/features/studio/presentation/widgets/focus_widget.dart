import 'package:flutter/material.dart';

class FocusWidget extends StatefulWidget {
  const FocusWidget({super.key});

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {
  double top = 0.0;
  double left = 0.0;
  final double width = 100.0;
  final double height = 100.0;
  bool isTapped = false; // State to track tap for border

  // This will be used to calculate the delta.
  Offset? dragStart;

  void onLongPressStart(LongPressStartDetails details) {
    setState(() {
      dragStart = details.localPosition;
    });
  }

  void updatePosition(LongPressMoveUpdateDetails details) {
    if (dragStart == null) return;

    setState(() {
      double deltaX = details.localPosition.dx - dragStart!.dx;
      double deltaY = details.localPosition.dy - dragStart!.dy;

      left += deltaX;
      top += deltaY;

      dragStart = details.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTapDown: (_) => setState(() => isTapped = true),
        onTapUp: (_) => setState(() => isTapped = false),
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: updatePosition,
        onLongPressUp: () {
          setState(() {
            dragStart = null;
            // Ensure the border is removed when the long press is released
            isTapped = false;
          });
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: isTapped
                ? Border.all(color: Colors.blueAccent, width: 5.0)
                : null,
          ),
        ),
      ),
    );
  }
}
