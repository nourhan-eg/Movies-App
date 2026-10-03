import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/widgets/custom_text_field.dart';
import 'package:movies/features/main_screen/tabs/search/presentation/bloc/search_bloc.dart';
import 'package:movies/features/main_screen/tabs/search/presentation/bloc/search_events.dart';
import 'package:movies/features/main_screen/tabs/search/presentation/bloc/search_states.dart';
import 'package:movies/features/movie_details/presentation/screens/movie_details_screen.dart';
import '../../../../../../core/widgets/movie_card.dart';


class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // text field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CustomTextField(
                      hintText: 'Search',
                      prefixIcon: 'assets/icons/search.svg',
                      onChanged: (value) {
                        context.read<SearchBloc>().add(
                          SearchMoviesRequested(query: value),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // movies
                  Expanded(
                    child: BlocConsumer<SearchBloc, SearchStates>(
                      listener: (context, state) {
                        if (state is SearchErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SearchLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SearchSuccessState) {
                          if (state.movies.isEmpty) {
                            return const Center(
                              child: Text(
                                'No results found',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
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
                              itemBuilder:(context, index) {
                                final movie = state.movies[index];
                                return InkWell(
                                    onTap: () {
                                      MovieDetailsScreen.open(context, movie);
                                    },
                                    child: MovieCard(movie: movie));},
                            ),
                          );
                        } else if (state is SearchErrorState) {
                          return const Center(
                            child: Text(
                              'Something went wrong',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        // initial state
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
