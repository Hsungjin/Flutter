import 'package:bloc_tutorial/ex_repository/repository_sample.dart';
import 'package:bloc_tutorial/ex_repository/repository_second_sample.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBlocDIMulti extends Bloc<SampleDIMultiEvent, int> {
  final RepositorySample _repositorySample;
  final RepositorySecondSample _repositorySecondSample;

  SampleBlocDIMulti(this._repositorySample, this._repositorySecondSample) : super(0) {
    on<SampleDIFirstEvent>((event, emit) async {
      var data = await _repositorySample.load();
      emit(data);
    });

    on<SampleDISecondEvent>((event, emit) async {
      var data = await _repositorySecondSample.load();
      emit(data);
    });
  }
}

abstract class SampleDIMultiEvent {}

class SampleDIFirstEvent extends SampleDIMultiEvent {}

class SampleDISecondEvent extends SampleDIMultiEvent {}
