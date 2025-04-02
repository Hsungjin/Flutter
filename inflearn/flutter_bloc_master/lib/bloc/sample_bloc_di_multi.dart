import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_master/repository/repository_sample.dart';
import 'package:flutter_bloc_master/repository/repository_second_sample.dart';

class SampleBlocDiMulti extends Bloc<SampleMultiDiEvent, int> {
  final RepositorySample _repositorySample;
  final RepositorySecondSample _repositorySecondSample;

  SampleBlocDiMulti(this._repositorySample, this._repositorySecondSample) : super(0) {
    on<SampleMultiDiFirstEvent>((event, emit) async {
      var data = await _repositorySample.load();
      emit(data);
    });
    on<SampleMultiDiSecondEvent>((event, emit) async {
      var data = await _repositorySecondSample.load();
      emit(data);
    });
  }
}

abstract class SampleMultiDiEvent {}

class SampleMultiDiFirstEvent extends SampleMultiDiEvent {}

class SampleMultiDiSecondEvent extends SampleMultiDiEvent {}

