part of 'canvas_bloc.dart';

@immutable
sealed class CanvasState {}

final class CanvasCurrentProperties extends CanvasState {
  final double width;
  final double height;
  final double scale;
  final double baseScale;
  final BoxDecoration decoration;

  CanvasCurrentProperties({
    required this.width,
    required this.height,
    required this.scale,
    required this.baseScale,
    required this.decoration,
  });
}
