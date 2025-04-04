import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final List<String> movies;

  const MovieState({required this.movies});

  @override
  List<Object?> get props => [movies];
}