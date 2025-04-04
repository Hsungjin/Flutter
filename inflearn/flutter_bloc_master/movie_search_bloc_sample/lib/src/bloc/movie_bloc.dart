import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_bloc_sample/src/bloc/movie_event.dart';
import 'package:movie_search_bloc_sample/src/bloc/movie_state.dart';
import 'package:movie_search_bloc_sample/src/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;

  MovieBloc(this._movieRepository) : super(const MovieState(movies: [])) {
    on<MovieSearchEvent>(_onMovieSearch, transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 1000)).flatMap(mapper));
    on<BtnSearchMovieEvent>(_onBtnSearchMovie);
  }

  void _onMovieSearch(MovieSearchEvent event, Emitter<MovieState> emit) async {
    final movies = await _movieRepository.search(event.key);
    emit(MovieState(movies: movies));
  }

  void _onBtnSearchMovie(BtnSearchMovieEvent event, Emitter<MovieState> emit) async {
    final movies = await _movieRepository.search('개들의 전쟁');
    emit(MovieState(movies: movies));
  }

  @override
  void onChange(Change<MovieState> change) {
    super.onChange(change);
    print('onChange: ${change}');
  }

  @override
  void onTransition(Transition<MovieEvent, MovieState> transition) {
    super.onTransition(transition);
    print('onTransition: ${transition}');
  }
}
