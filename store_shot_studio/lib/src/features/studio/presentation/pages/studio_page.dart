import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/frame_background.dart';

@RoutePage()
class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studio'),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: FrameBackground(
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
