import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_bloc_sample/src/bloc/movie_bloc.dart';
import 'package:movie_search_bloc_sample/src/bloc/movie_event.dart';
import 'package:movie_search_bloc_sample/src/bloc/movie_state.dart';
import 'package:movie_search_bloc_sample/src/cubit/movie_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('영화 검색')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MovieBloc>().add(BtnSearchMovieEvent());
        },
        child: const Icon(Icons.search),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: '영화 제목을 입력하세요'),
            onChanged: (value) {
              // context.read<MovieCubit>().search(value);
              context.read<MovieBloc>().add(MovieSearchEvent(key: value));
            },
          ),

          // Expanded(
          //   child: BlocBuilder<MovieCubit, List<String>>(
          //     builder: (context, state) {
          //       return ListView.separated(
          //         padding: const EdgeInsets.all(10),
          //         itemBuilder: (context, index) => Text(state[index]),
          //         separatorBuilder: (context, index) => const Divider(color: Colors.grey),
          //         itemCount: state.length,
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) => Text(state.movies[index]),
                  separatorBuilder: (context, index) => const Divider(color: Colors.grey),
                  itemCount: state.movies.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
