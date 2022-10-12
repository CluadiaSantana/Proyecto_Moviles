import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tutoapp_event.dart';
part 'tutoapp_state.dart';

class TutoappBloc extends Bloc<TutoappEvent, TutoappState> {
  TutoappBloc() : super(TutoappInitial()) {
    on<TutoappEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
