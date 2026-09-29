import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/movie_card.dart';

import '../../../../../core/api/api_manager.dart';
import '../../data/data_sources/browse_remote_data_source_impl.dart';
import '../../data/repositories/browse_repository_impl.dart';
import '../../domain/usecases/get_movies_by_genre_usecase.dart';
import '../bloc/browse_bloc.dart';
import '../bloc/browse_events.dart';
import '../bloc/browse_states.dart';

class GenreTab extends StatelessWidget {
  final String genre;

  const GenreTab({required this.genre});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      BrowseBloc(
        getMoviesByGenreUsecase: GetMoviesByGenreUsecase(
          BrowseRepositoryImpl(
            BrowseRemoteDataSourceImpl(ApiManager()),
          ),
        ),
      )
        ..add(GetMoviesByGenreRequested(genre: genre)),
      child: BlocConsumer<BrowseBloc, BrowseStates>(
        listener: (context, state) {
          if (state is BrowseFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is BrowseLoading || state is BrowseInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BrowseFailure) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is BrowseLoaded) {
            if (state.movies.isEmpty) {
              return const Center(child: Text('No movies found'));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                  itemCount: state.movies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65),
                  itemBuilder:(context, index) => MovieCard(movie: state.movies[index]),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}