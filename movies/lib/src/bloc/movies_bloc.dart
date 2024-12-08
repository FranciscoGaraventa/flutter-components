import 'dart:async';

import 'package:movies/src/model/movie_model.dart';

import 'bloc_result.dart';
import 'i_bloc.dart';

class MoviesBloc extends IBloc {
  final StreamController<BlocResult<MovieModel>> _moviesController = StreamController.broadcast();

  Stream<BlocResult<MovieModel>> get movieStream => _moviesController.stream;

  Future<void> loadMovie({required dynamic arguments}) async {
    _moviesController.sink.add(Loading());
    try {
      var movie = MovieModel.fromJson(Map<String, dynamic>.from(arguments));
      _moviesController.sink.add(Success(data: movie));
    } catch (e) {
      _moviesController.sink.add(Failure(error: e.toString()));
    }
  }

  @override
  void dispose() {
    _moviesController.close();
  }

  @override
  void initialize() {}
}
