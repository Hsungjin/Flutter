import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    print('SampleBloc 생성');
    on<SampleEvent>((event, emit) {
      print('SampleEvent 발생');
    });
    on<AddSampleEvent>((event, emit) {
      print('AddSampleEvent 발생');
      emit(state + 1);
    });
    on<MinusSampleEvent>((event, emit) {
      print('MinusSampleEvent 발생');
      emit(state - 1);
    });
  }
}

class SampleEvent {}

class AddSampleEvent extends SampleEvent {}

class MinusSampleEvent extends SampleEvent {}