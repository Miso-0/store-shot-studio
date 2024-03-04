import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/canvas/bloc/canvas_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'dart:io';

class CanvasBackground extends StatelessWidget {
  CanvasBackground({super.key, required this.child});
  final Widget child;
  final repaintBoundaryKey = GlobalKey();
  Future<void> saveImage(Uint8List pngBytes) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String fullPath = '$dir/screenshot.png';
    File file = File(fullPath);
    await file.writeAsBytes(pngBytes);
    print('screenshot saved to $fullPath');
  }

  Future<Uint8List> capturePng() async {
    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: repaintBoundaryKey,
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                capturePng();
              },
              icon: Icon(Icons.camera)),
          BlocProvider(
            create: (context) => CanvasBloc(),
            child: BlocBuilder<CanvasBloc, CanvasState>(
              builder: (context, state) {
                final properties = state as CanvasCurrentProperties;
                return Listener(
                  onPointerSignal: (event) {
                    if (event is PointerScrollEvent) {
                      final newScale =
                          state.scale + (event.scrollDelta.dy / 1000);
                      // Ensure that the scale factor stays within reasonable bounds
                      context.read<CanvasBloc>().add(
                            CanvasPropertiesUpdated(
                              width: properties.width,
                              height: properties.height,
                              scale: newScale.clamp(0.1, 10.0),
                              baseScale: properties.baseScale,
                              decoration: properties.decoration,
                            ),
                          );
                    }
                  },
                  child: GestureDetector(
                    onScaleUpdate: (ScaleUpdateDetails details) {
                      context.read<CanvasBloc>().add(
                            CanvasPropertiesUpdated(
                              width: properties.width,
                              height: properties.height,
                              scale: properties.baseScale * details.scale,
                              baseScale: properties.baseScale,
                              decoration: properties.decoration,
                            ),
                          );
                    },
                    onScaleEnd: (ScaleEndDetails details) {
                      context.read<CanvasBloc>().add(
                            CanvasPropertiesUpdated(
                              width: properties.width,
                              height: properties.height,
                              scale: properties.scale,
                              baseScale: properties.scale,
                              decoration: properties.decoration,
                            ),
                          );
                    },
                    child: Transform.scale(
                      scale: properties.scale,
                      child: Center(
                        child: Container(
                          width: properties.width,
                          height: properties.height,
                          decoration: properties.decoration,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
