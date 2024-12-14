import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/movie_model.dart';
import '../utils/dimens.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movie,
    this.posterHeight = 250.0,
    this.posterBorderRadius = 20.0,
    this.posterFilterQuality = FilterQuality.high,
    this.posterBoxFit = BoxFit.cover,
    this.titleFontSize = CustomTextFontSize.fontSizeXSmall,
    this.releaseDateFormat = 'MMM dd, yyyy'
  });

  final MovieModel movie;

  final double posterHeight;
  final double posterBorderRadius;
  final FilterQuality posterFilterQuality;
  final BoxFit posterBoxFit;
  final double titleFontSize;
  final String releaseDateFormat;

  Widget _buildPosterImage({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(CustomPadding.paddingXSmall),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: posterHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(posterBorderRadius)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(posterBorderRadius),
          child: Image.network(
            movie.getPosterPath!,
            filterQuality: posterFilterQuality,
            fit: posterBoxFit,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomPadding.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: titleFontSize,
            ),
          ),
          Text(DateFormat(releaseDateFormat).format(DateTime.parse(movie.releaseDate)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPosterImage(context: context),
        _buildMovieDetail(),
      ],
    );
  }
}
