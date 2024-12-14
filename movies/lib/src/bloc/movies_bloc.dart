import 'dart:async';
import 'dart:convert';

import 'package:movies/src/model/movie_model.dart';

import 'bloc_result.dart';
import 'i_bloc.dart';

class MoviesBloc extends IBloc {
  final StreamController<BlocResult<MovieModel>> _moviesController = StreamController.broadcast();
  final StreamController<BlocResult<List<MovieModel>>> _movieListController = StreamController.broadcast();

  Stream<BlocResult<MovieModel>> get movieStream => _moviesController.stream;

  Stream<BlocResult<List<MovieModel>>> get movieListStream => _movieListController.stream;

  Future<void> loadMovie({required dynamic arguments}) async {
    _moviesController.sink.add(Loading());
    try {
      var movieJson = jsonDecode(arguments) as Map<String, dynamic>;
      MovieModel movie = MovieModel.fromJson(movieJson);
      _moviesController.sink.add(Success(data: movie));
    } catch (e) {
      _moviesController.sink.add(Failure(error: e.toString()));
    }
  }

  Future<void> getMovieList({required dynamic arguments}) async {
    _movieListController.sink.add(Loading());
    try {
      var movieJsonList = jsonDecode(arguments) as List<dynamic>;
      List<MovieModel> movies = movieJsonList.map((result) => MovieModel.movieCardFromJson(result as Map<String, dynamic>)).toList();
      _movieListController.sink.add(Success(data: movies));
    } catch (e) {
      _movieListController.sink.add(Failure(error: e.toString()));
    }
  }

  @override
  void dispose() {
    _moviesController.close();
    _movieListController.close();
  }

  @override
  void initialize() {}
}
