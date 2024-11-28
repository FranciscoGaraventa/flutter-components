import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/movies.dart';
import 'package:movies/src/bloc/bloc_result.dart';
import 'package:movies/src/model/movie_model.dart';
import 'package:movies/src/view/movie_detail_view.dart';

const methodChannel = MethodChannel('com.globant.movies.channel');

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    methodChannel.setMethodCallHandler((call) async {
      var state = States.values.firstWhere((st) => st.state == call.method);
      switch (state) {
        case States.load:
          context.read<MoviesBloc>().loadMovie(arguments: call.arguments);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: StreamBuilder<BlocResult<MovieModel>>(
            stream: context.read<MoviesBloc>().movieStream,
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

              var movie = (snapshot.data as Success<MovieModel>).data;
              return MovieDetailView(movie: movie);
            }),
      ),
    );
  }
}

enum States {
  load('loadState');

  const States(this.state);

  final String state;
}
