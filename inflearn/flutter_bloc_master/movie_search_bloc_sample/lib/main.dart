import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_bloc_sample/src/app.dart';
import 'package:movie_search_bloc_sample/src/bloc/movie_bloc.dart';
import 'package:movie_search_bloc_sample/src/cubit/movie_cubit.dart';
import 'package:movie_search_bloc_sample/src/repository/movie_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RepositoryProvider(
        create: (context) => MovieRepository(),
        child: BlocProvider(
          // create: (context) => MovieCubit(context.read<MovieRepository>()),
          create: (context) => MovieBloc(context.read<MovieRepository>()),
          child: const App(),
        ),
      ),
    );
  }
}