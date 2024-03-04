import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'studio_event.dart';
part 'studio_state.dart';

class StudioBloc extends Bloc<StudioEvent, StudioState> {
  StudioBloc() : super(StudioInitial()) {
    on<StudioEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
