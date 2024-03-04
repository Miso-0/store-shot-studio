import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/canvas/canvas_background.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/focus_widget.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/side_panel.dart';

@RoutePage()
class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: CanvasBackground(
              child: Stack(
                children: [FocusWidget()],
              ),
            ),
          ),
          Expanded(flex: 1, child: SidePanel()),
        ],
      ),
    );
  }
}
