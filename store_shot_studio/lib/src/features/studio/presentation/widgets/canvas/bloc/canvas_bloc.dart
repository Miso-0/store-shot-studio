import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'canvas_event.dart';
part 'canvas_state.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc()
      : super(CanvasCurrentProperties(
          baseScale: 1.0,
          scale: 1.0,
          width: 500,
          height: 500,
          decoration: const BoxDecoration(color: Colors.red),
        )) {
    on<CanvasPropertiesUpdated>((event, emit) {
      emit(
        CanvasCurrentProperties(
          width: event.width,
          height: event.height,
          scale: event.scale,
          baseScale: event.baseScale,
          decoration: event.decoration,
        ),
      );
    });
  }
}
