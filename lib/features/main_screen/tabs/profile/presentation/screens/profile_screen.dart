import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_routes.dart';
import '../../../../../../core/widgets/app_avatars.dart';
import '../bloc/history_bloc/history_bloc.dart';
import '../bloc/history_bloc/history_event.dart';
import '../bloc/history_bloc/history_state.dart';
import '../bloc/user_profile_bloc/profile_bloc.dart';
import '../bloc/user_profile_bloc/profile_event.dart';
import '../bloc/user_profile_bloc/profile_state.dart';
import '../bloc/wishlist_bloc/wishlist_bloc.dart';
import '../bloc/wishlist_bloc/wishlist_event.dart';
import '../bloc/wishlist_bloc/wishlist_state.dart';
import '../screens/edit_profile_screen.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_movies_grid.dart';
import '../widgets/profile_tab_bar.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.login,
              (route) => false,
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Profile Header
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        final wishlistState =
                            context.watch<WishlistBloc>().state;
                        final historyState =
                            context.watch<HistoryBloc>().state;

                        final wishCount = wishlistState is WishlistLoaded
                            ? wishlistState.movies.length
                            : 0;
                        final historyCount = historyState is HistoryLoaded
                            ? historyState.movies.length
                            : 0;

                        if (state is ProfileLoaded) {
                          return ProfileHeader(
                            name: state.user.name,
                            avatarPath: AppAvatars.resolve(state.user.photoUrl),
                            wishListCount: wishCount,
                            historyCount: historyCount,
                            onEditProfile: () {
                              EditProfileScreen.open(context, state.user);
                            },
                            onExit: () {
                              context.read<ProfileBloc>().add(LogoutRequest());
                            },
                          );
                        }
                        if (state is ProfileError) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<ProfileBloc>()
                                          .add(LoadProfile());
                                    },
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: CircularProgressIndicator(
                              color: AppColors.yellow,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // Tab Bar
                    ProfileTabBar(
                      selectedIndex: _selectedTabIndex,
                      onTabChanged: (index) {
                        setState(() => _selectedTabIndex = index);
                      },
                    ),

                    Container(
                      height: 1,
                      color: AppColors.darkGrey,
                    ),

                    const SizedBox(height: 8),

                    // Movies Grid according to active tab
                    _selectedTabIndex == 0
                        ? BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (context, wishlistState) {
                              if (wishlistState is WishlistLoading) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: CircularProgressIndicator(
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                );
                              }
                              if (wishlistState is WishlistLoaded) {
                                return ProfileMoviesGrid(
                                  movies: wishlistState.movies,
                                  isEmpty: wishlistState.movies.isEmpty,
                                );
                              }
                              if (wishlistState is WishlistError) {
                                return Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        wishlistState.message,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<WishlistBloc>()
                                              .add(LoadWishlist());
                                        },
                                        child: const Text('Retry'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const ProfileMoviesGrid(
                                movies: [],
                                isEmpty: true,
                              );
                            },
                          )
                        : BlocBuilder<HistoryBloc, HistoryState>(
                            builder: (context, historyState) {
                              if (historyState is HistoryLoading) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(32.0),
                                    child: CircularProgressIndicator(
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                );
                              }
                              if (historyState is HistoryLoaded) {
                                return ProfileMoviesGrid(
                                  movies: historyState.movies,
                                  isEmpty: historyState.movies.isEmpty,
                                );
                              }
                              if (historyState is HistoryError) {
                                return Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        historyState.message,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<HistoryBloc>()
                                              .add(LoadHistory());
                                        },
                                        child: const Text('Retry'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const ProfileMoviesGrid(
                                movies: [],
                                isEmpty: true,
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
