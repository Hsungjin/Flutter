import 'package:flutter_bloc/flutter_bloc.dart';

class SampleSecondBloc extends Bloc<SampleSecondEvent, int> {
  SampleSecondBloc() : super(0) {
    on<SampleSecondEvent>((event, emit) async {
      print('Sample Seconds Event Called');
    });
  }
}

class SampleSecondEvent {}
