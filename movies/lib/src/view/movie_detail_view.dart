import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/src/model/movie_model.dart';

import '../config/theme/palette.dart';
import '../model/cast_model.dart';
import '../utils/dimens.dart';
import '../widget/movie_property.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  static const positionedZero = 0.0;

  Widget _buildCastMembers({required List<CastModel> castList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(CustomPadding.paddingSmall),
          child: Text(
            'Cast',
            style: TextStyle(
              color: primary50,
              fontWeight: FontWeight.bold,
              fontSize: CustomTextFontSize.fontSizeMedium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            viewportFraction: 0.25,
          ),
          items: castList.map(
                (cast) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CustomPadding.paddingXSmall,
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black, Colors.transparent]).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Container(
                            width: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  CustomBorderRadius.borderRadiusLarge,
                                ),
                              ),
                              image: cast.getProfilePath.isNotEmpty
                                  ? DecorationImage(
                                image: NetworkImage(cast.getProfilePath),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              )
                                  : const DecorationImage(
                                image: AssetImage('assets/unknown_cast.jpeg', package: 'movies'),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(CustomPadding.paddingSmall),
                          child: Text(
                            cast.name,
                            style: TextStyle(
                              color: secondary100,
                              fontSize: CustomTextFontSize.fontSizeSmall,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget _buildMovieDetails() {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ).createShader(
              Rect.fromLTRB(
                positionedZero,
                positionedZero,
                rect.width,
                rect.height,
              ),
            );
          },
          blendMode: BlendMode.dstIn,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.movie.getBackdropPath),
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomPadding.paddingXSmall),
                child: Text(
                  widget.movie.title,
                  style: TextStyle(
                    color: primary50,
                    fontWeight: FontWeight.bold,
                    fontSize: CustomTextFontSize.fontSizeBig,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: CustomPadding.paddingXSmall,
                ),
                child: Text(
                  widget.movie.genresText(),
                  style: TextStyle(
                    color: secondary900,
                    fontWeight: FontWeight.w500,
                    fontSize: CustomTextFontSize.fontSizeXSmall,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MovieProperty(
                    propertyValue: widget.movie.voteCount.toString(),
                    propertyName: 'Vote Count',
                  ),
                  MovieProperty(
                    propertyValue: widget.movie.voteAverage,
                    propertyName: 'Vote Average',
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: positionedZero,
          right: positionedZero,
          bottom: positionedZero,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: CustomPadding.paddingMedium,
                    horizontal: CustomPadding.paddingSmall,
                  ),
                  child: Text(
                    widget.movie.overview,
                    style: TextStyle(
                      color: primary50,
                      fontWeight: FontWeight.bold,
                      fontSize: CustomTextFontSize.fontSizeXSmall,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                _buildCastMembers(castList: widget.movie.cast),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
              ),
              onPressed: () => {},
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: backgroundColor),
          child: _buildMovieDetails(),
        ),
      ),
    );
  }
}
