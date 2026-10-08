import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_texts.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/text_styles.dart';
import '../../../main_screen/tabs/home/domain/entities/movie_entity.dart';
import '../../../main_screen/tabs/profile/presentation/bloc/history_bloc/history_bloc.dart';
import '../../../main_screen/tabs/profile/presentation/bloc/history_bloc/history_event.dart';
import '../../../main_screen/tabs/profile/presentation/bloc/wishlist_bloc/wishlist_bloc.dart';
import '../../../main_screen/tabs/profile/presentation/bloc/wishlist_bloc/wishlist_event.dart';
import '../../../main_screen/tabs/profile/presentation/bloc/wishlist_bloc/wishlist_state.dart';
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

class MovieDetailsScreen extends StatefulWidget {
  final MovieEntity movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  static void open(BuildContext context, MovieEntity movie) {
    final wishlistBloc = context.read<WishlistBloc>();
    final historyBloc = context.read<HistoryBloc>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<MovieDetailsBloc>(
              create: (_) => getIt<MovieDetailsBloc>()
                ..add(FetchMovieDetailsEvent(movie.id)),
            ),
            BlocProvider.value(value: wishlistBloc),
            BlocProvider.value(value: historyBloc),
          ],
          child: MovieDetailsScreen(movie: movie),
        ),
      ),
    );
  }

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(AddToHistoryRequest(widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    final isBookmarked = context.select<WishlistBloc, bool>(
      (bloc) =>
          bloc.state is WishlistLoaded &&
          (bloc.state as WishlistLoaded)
              .movies
              .any((m) => m.id == widget.movie.id),
    );

    return BlocListener<WishlistBloc, WishlistState>(
      listener: (context, state) {
        if (state is WishlistError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.red,
            ),
          );
        }
      },
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
                              .add(FetchMovieDetailsEvent(widget.movie.id));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                        ),
                        child: Text(
                          AppTexts.retry,
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
                      isBookmarked: isBookmarked,
                      onBookmarkPressed: () {
                        if (isBookmarked) {
                          context
                              .read<WishlistBloc>()
                              .add(RemoveFromWishlistRequest(widget.movie));
                        } else {
                          context
                              .read<WishlistBloc>()
                              .add(AddToWishlistRequest(widget.movie));
                        }
                      },
                      onWatchPressed: () {
                        // Action for Watch
                      },
                      onPlayPressed: () {
                        // Action for Trailer / Play
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
                      onMovieTap: (selectedMovie) {
                        MovieDetailsScreen.open(context, selectedMovie);
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
