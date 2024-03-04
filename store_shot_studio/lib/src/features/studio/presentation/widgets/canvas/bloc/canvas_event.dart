part of 'canvas_bloc.dart';

@immutable
sealed class CanvasEvent {}


final class CanvasPropertiesUpdated extends CanvasEvent {
  final double width;
  final double height;
  final double scale;
  final double baseScale;
  final BoxDecoration decoration;

  CanvasPropertiesUpdated({
    required this.width,
    required this.height,
    required this.scale,
    required this.baseScale,
    required this.decoration,
  });
}