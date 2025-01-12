import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    print('init SampleBloc');
    on<SampleEvent>((event, emit) {
      print('Sample Event Called');
    });

    on<AddSampleEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class SampleEvent {}

class AddSampleEvent extends SampleEvent {}
