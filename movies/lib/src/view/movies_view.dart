import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/movies.dart';
import 'package:movies/src/bloc/bloc_result.dart';
import 'package:movies/src/model/movie_model.dart';
import 'package:movies/src/widget/movie_card_widget.dart';

import '../utils/dimens.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler((call) async {
      var state = States.values.firstWhere((st) => st.state == call.method);
      switch (state) {
        case States.load:
          context.read<MoviesBloc>().getMovieList(arguments: call.arguments);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: StreamBuilder<BlocResult<List<MovieModel>>>(
            stream: context.read<MoviesBloc>().movieListStream,
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data is Loading) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.data is Failure) {
                var error = (snapshot.data as Failure<String>).error;
                return Scaffold(
                  body: Center(
                    child: Text(error),
                  ),
                );
              }

              var movies = (snapshot.data as Success<List<MovieModel>>).data;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCardWidget(movie: movies[index]);
                  });
            }),
      ),
    );
  }
}
