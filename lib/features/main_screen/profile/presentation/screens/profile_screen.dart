import 'package:flutter/material.dart';
import '../../../../../core/app_colors.dart';
import '../../../../../core/widgets/app_avatars.dart';
import '../../../home/domain/entities/movie_entity.dart';
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

  // ── Dummy data ─────────────────────────────────────────────────────────────
  static const _dummyUser = (
    name: 'John Safwat',
    avatar: AppAvatars.beardMan,
    wishListCount: 12,
    historyCount: 10,
  );

  static final List<MovieEntity> _wishListMovies = [
    MovieEntity(
      id: 1,
      title: 'Black Widow',
      posterImage:
          'https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 2,
      title: 'Hobbs & Shaw',
      posterImage:
          'https://image.tmdb.org/t/p/w500/keym7MPn4aMFAGZJ8GFczT7TKXF.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 3,
      title: '1917',
      posterImage:
          'https://image.tmdb.org/t/p/w500/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
      rating: 7.7,
      genres: ['Drama'],
    ),
    MovieEntity(
      id: 4,
      title: 'Avengers',
      posterImage:
          'https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7429EjOy.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 5,
      title: 'Avengers: Endgame',
      posterImage:
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 6,
      title: 'Black Widow 2',
      posterImage:
          'https://image.tmdb.org/t/p/w500/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 7,
      title: 'Black Panther',
      posterImage:
          'https://image.tmdb.org/t/p/w500/uxzzxijgPIY7slzFvMotPv8wjKA.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 8,
      title: 'Doctor Strange',
      posterImage:
          'https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 9,
      title: 'Doctor Who',
      posterImage:
          'https://image.tmdb.org/t/p/w500/lDjPSMC0HoILtHOHsSmMXM4kVFT.jpg',
      rating: 7.7,
      genres: ['Sci-Fi'],
    ),
    MovieEntity(
      id: 10,
      title: 'Godzilla',
      posterImage:
          'https://image.tmdb.org/t/p/w500/xvx4Yhf0DVH8G4LzNISpMfFBDy2.jpg',
      rating: 7.7,
      genres: ['Action'],
    ),
    MovieEntity(
      id: 11,
      title: 'Wednesday',
      posterImage:
          'https://image.tmdb.org/t/p/w500/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
      rating: 7.7,
      genres: ['Horror'],
    ),
    MovieEntity(
      id: 12,
      title: 'Jungle Cruise',
      posterImage:
          'https://image.tmdb.org/t/p/w500/9dKCd55IuTT5QRs989m9Wr4S6pP.jpg',
      rating: 7.7,
      genres: ['Adventure'],
    ),
  ];

  /// History tab shows empty state as in the screenshot
  static final List<MovieEntity> _historyMovies = [];

  // ────────────────────────────────────────────────────────────────────────────

  List<MovieEntity> get _currentTabMovies =>
      _selectedTabIndex == 0 ? _wishListMovies : _historyMovies;

  bool get _currentTabIsEmpty => _currentTabMovies.isEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
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

                  // ── Profile Header ──────────────────────────────────────
                  ProfileHeader(
                    name: _dummyUser.name,
                    avatarPath: _dummyUser.avatar,
                    wishListCount: _dummyUser.wishListCount,
                    historyCount: _dummyUser.historyCount,
                    onEditProfile: () {},
                    onExit: () {},
                  ),

                  const SizedBox(height: 20),

                  // ── Tab Bar ─────────────────────────────────────────────
                  ProfileTabBar(
                    selectedIndex: _selectedTabIndex,
                    onTabChanged: (index) {
                      setState(() => _selectedTabIndex = index);
                    },
                  ),

                  // Divider under tabs
                  Container(
                    height: 1,
                    color: AppColors.darkGrey,
                  ),

                  const SizedBox(height: 8),

                  // ── Content ─────────────────────────────────────────────
                  ProfileMoviesGrid(
                    movies: _currentTabMovies,
                    isEmpty: _currentTabIsEmpty,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
