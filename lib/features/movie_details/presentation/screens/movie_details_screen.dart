import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/text_styles.dart';
import '../bloc/movie_details_bloc.dart';
import '../bloc/movie_details_event.dart';
import '../bloc/movie_details_state.dart';
import '../widgets/movie_cast_section.dart';
import '../widgets/movie_details_header.dart';
import '../widgets/movie_genres_section.dart';
import '../widgets/movie_screenshots_section.dart';
import '../widgets/movie_similar_section.dart';
import '../widgets/movie_stats_bar.dart';
import '../widgets/movie_summary_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => getIt<MovieDetailsBloc>()..add(FetchMovieDetailsEvent(movieId)),
      child: Scaffold(
        backgroundColor: AppColors.dark,
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellow,
                ),
              );
            }

            if (state is MovieDetailsError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.red,
                        size: 54,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: TextStyles.headingSmall(AppColors.white),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<MovieDetailsBloc>()
                              .add(FetchMovieDetailsEvent(movieId));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                        ),
                        child: Text(
                          'Retry',
                          style: TextStyles.headingSmall(AppColors.dark),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is MovieDetailsSuccess) {
              final movie = state.movieDetails;
              final suggestions = state.suggestions;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieDetailsHeader(
                      posterImage: movie.posterImage,
                      backgroundImage: movie.backgroundImage,
                      title: movie.title,
                      year: movie.year,
                      onWatchPressed: () {
                        // Action for Watch
                      },
                      onPlayPressed: () {
                        // Action for Trailer / Play
                      },
                      onBookmarkPressed: () {
                        // Action for Bookmark
                      },
                    ),

                    MovieStatsBar(
                      likeCount: movie.likeCount,
                      runtime: movie.runtime,
                      rating: movie.rating,
                    ),

                    MovieScreenshotsSection(
                      screenshots: movie.screenshots,
                    ),

                    MovieSimilarSection(
                      movies: suggestions,
                      onMovieTap: (selectedMovieId) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MovieDetailsScreen(
                              movieId: selectedMovieId,
                            ),
                          ),
                        );
                      },
                    ),

                    MovieSummarySection(
                      summary: movie.summary,
                    ),

                    MovieCastSection(
                      cast: movie.cast,
                    ),

                    MovieGenresSection(
                      genres: movie.genres,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
