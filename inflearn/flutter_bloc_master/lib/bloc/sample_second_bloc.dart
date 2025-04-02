import 'package:flutter_bloc/flutter_bloc.dart';

class SampleSecondBloc extends Bloc<SampleSecondEvent, int>{
  SampleSecondBloc() : super(0) {
    on<SampleSecondEvent>((event, emit) {
      print('SampleSecondEvent 발생');
    });
  }
}

class SampleSecondEvent {}