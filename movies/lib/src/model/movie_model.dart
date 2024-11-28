import 'package:movies/src/model/cast_model.dart';
import 'package:movies/src/utils/list_utils.dart';

import 'genre_model.dart';

class MovieModel {
  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.cast,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genres: List<GenreModel>.from(
          (json['genres'] as List<dynamic>).map((result) => GenreModel.fromJson(result as Map<String, dynamic>)),
        ),
        cast: List<CastModel>.from(
          (json['cast'] as List<dynamic>).map((result) => CastModel.fromJson(result as Map<String, dynamic>)),
        ),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toString(),
        voteCount: json['vote_count'],
      );

  String? get getPosterPath => posterPath != null ? 'https://image.tmdb.org/t/p/w500/$posterPath' : null;

  String get getBackdropPath => 'https://image.tmdb.org/t/p/w500/$backdropPath';

  String genresText() {
    StringBuffer sb = StringBuffer('');
    for (var genre in genres) {
      sb.write(genres.firstWhereOrNull((g) => g.id == genre.id)?.name ?? '');
      sb.write(' / ');
    }
    return sb.toString().substring(
          0,
          sb.length - 2,
        );
  }

  final bool adult;
  final String? backdropPath;
  final List<GenreModel> genres;
  final List<CastModel> cast;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final String voteAverage;
  final int voteCount;
}
