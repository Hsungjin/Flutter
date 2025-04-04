import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {}

class MovieSearchEvent extends MovieEvent {
  final String key;

  MovieSearchEvent({required this.key});

  @override
  List<Object?> get props => [key];
}

class BtnSearchMovieEvent extends MovieEvent { 

  @override
  List<Object?> get props => [];
}
