import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_bloc_sample/src/repository/movie_repository.dart';

class MovieCubit extends Cubit<List<String>> {
  final MovieRepository _movieRepository; 

  MovieCubit(this._movieRepository) : super([]);

  void search(String key) async {
    final result = await _movieRepository.search(key);
    emit(result);
  }

  @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);
    // print('onChange: ${change.currentState}');
  }
}

