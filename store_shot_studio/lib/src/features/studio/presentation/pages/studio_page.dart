import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/frame_background.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/frames/phones/iphone_14_frame.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/selected_widget.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/side_panel.dart';

@RoutePage()
class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: FrameBackground(
              width: 500,
              height: 500,
              child: Stack(
                children: [Iphone14Frame()],
              ),
            ),
          ),
          Expanded(flex: 1, child: SidePanel()),
        ],
      ),
    );
  }
}