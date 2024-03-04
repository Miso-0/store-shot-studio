import 'package:flutter/material.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/selected_widget.dart';

class Iphone14Frame extends StatelessWidget {
  const Iphone14Frame({
    super.key,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.width = 200,
    this.height = 200,
  });
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: SelectableWidget(
        onSizeChanged: (Size size) {},
        builder: (context, sele) {
          return SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height,
                  color: Colors.blue,
                ),
                Image.asset(
                  width: width,
                  height: height,
                  'assets/frames/phones/Apple iPhone 14/Device With Shadow/iPhone 14 ΓÇô Midnight With Shadow.png',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
