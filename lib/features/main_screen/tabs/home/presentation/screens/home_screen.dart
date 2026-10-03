import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app_colors.dart';
import 'package:movies/features/movie_details/presentation/screens/movie_details_screen.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../widgets/genre_section.dart';
import '../widgets/home_banner.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home route";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.yellow),
            );
          } else if (state is HomeLoaded) {
            final movies = state.movies;

            if (movies.isEmpty) {
              return const Center(
                child: Text(
                  'No movies available',
                  style: TextStyle(color: AppColors.white, fontSize: 16.0),
                ),
              );
            }

            final uniqueGenres = movies
                .expand((movie) => movie.genres)
                .toSet()
                .toList();

            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      HomeBanner(
                        movies: movies,
                        onMovieTap: (selectedMovie) {
                          MovieDetailsScreen.open(context, selectedMovie);
                        },
                      ),

                      const SizedBox(height: 12.0),
                      ...uniqueGenres.map((genre) {
                        final genreMovies = movies
                            .where((movie) => movie.genres.contains(genre))
                            .toList();

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: GenreSection(
                            genre: genre,
                            movies: genreMovies,
                            onMovieTap: (selectedMovie) {
                              MovieDetailsScreen.open(context, selectedMovie);
                            },
                            onSeeMoreTap: () {
                              // Action on selecting See More
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  color: AppColors.red,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
