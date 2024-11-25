import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<CounterEvent, RegistrationBlocState> {
  RegistrationBloc() : super(CountInitial(count: 5)) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  void _onIncrement(CounterEvent event, Emitter<RegistrationBlocState> emit) {
    if (state is CountInitial) {
      final currentState = state as CountInitial;
      emit(CountInitial(count: currentState.count + 1));
    }
  }

  void _onDecrement(CounterEvent event, Emitter<RegistrationBlocState> emit) {
    if (state is CountInitial) {
      final currentState = state as CountInitial;
      if (currentState.count > 0) {
        emit(CountInitial(count: currentState.count - 1));
      }
    }
  }
}
