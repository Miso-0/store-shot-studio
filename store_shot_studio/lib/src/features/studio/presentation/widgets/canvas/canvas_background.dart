import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_shot_studio/src/features/studio/presentation/widgets/canvas/bloc/canvas_bloc.dart';

class CanvasBackground extends StatelessWidget {
  const CanvasBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CanvasBloc(),
      child: BlocBuilder<CanvasBloc, CanvasState>(
        builder: (context, state) {
          final properties = state as CanvasCurrentProperties;
          return Listener(
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final newScale = state.scale + (event.scrollDelta.dy / 1000);
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
    );
  }
}
