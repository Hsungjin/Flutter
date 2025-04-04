import 'package:count_state_manage_sample_bloc/src/bloc/count_event.dart';
import 'package:count_state_manage_sample_bloc/src/bloc/count_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountState(count: 0)) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  void _onIncrement(Increment event, Emitter<CountState> emit) {
    emit(CountState(count: state.count + 1));
  }

  void _onDecrement(Decrement event, Emitter<CountState> emit) {
    emit(CountState(count: state.count - 1));
  }
}