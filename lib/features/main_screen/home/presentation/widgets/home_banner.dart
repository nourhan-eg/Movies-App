import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_colors.dart';
import '../../domain/entities/movie_entity.dart';
import '../../../../../core/widgets/movie_card.dart';


class HomeBanner extends StatefulWidget {
  final List<MovieEntity> movies;
  final ValueChanged<MovieEntity>? onMovieTap;

  const HomeBanner({super.key, required this.movies, this.onMovieTap});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    final viewportFraction = screenWidth > 700
        ? 0.38
        : (screenWidth > 500 ? 0.48 : 0.62);

    _pageController = PageController(
      viewportFraction: viewportFraction,
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) return const SizedBox.shrink();

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final activeMovie =
        widget.movies[_currentIndex.clamp(0, widget.movies.length - 1)];

    final carouselHeight = (screenHeight * 0.40).clamp(280.0, 400.0);
    final cardWidth = (screenWidth * 0.55).clamp(180.0, 270.0);
    final cardHeight = carouselHeight - 12.0;

    final headerFontSize = (screenWidth * 0.09).clamp(32.0, 48.0);
    final footerFontSize = (screenWidth * 0.10).clamp(36.0, 54.0);

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: KeyedSubtree(
              key: ValueKey<int>(activeMovie.id),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    activeMovie.posterImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(color: AppColors.dark),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: AppColors.black.withValues(alpha: 0.5),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, AppColors.dark],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


        Padding(
          padding: EdgeInsets.symmetric(vertical:screenHeight*0.04 ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mediaQuery.padding.top > 0 ? 8.0 : 16.0),


              Text(
                'Available Now',
                textAlign: TextAlign.center,
                style: GoogleFonts.coveredByYourGrace(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  shadows: [
                    Shadow(
                      color: AppColors.black.withValues(alpha: 0.6),
                      blurRadius: 8.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12.0),

              SizedBox(
                height: carouselHeight,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.movies.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final movie = widget.movies[index];

                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = (_pageController.page! - index);
                          value = (1 - (value.abs() * 0.18)).clamp(0.82, 1.0);
                        } else {
                          value = index == _currentIndex ? 1.0 : 0.82;
                        }

                        return Center(
                          child: Transform.scale(
                            scale: value,
                            child: MovieCard(
                              movie: movie,
                              width: cardWidth,
                              height: cardHeight,
                              onTap: () => widget.onMovieTap?.call(movie),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 12.0),

              Text(
                'Watch Now',
                textAlign: TextAlign.center,
                style: GoogleFonts.coveredByYourGrace(
                  fontSize: footerFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  shadows: [
                    Shadow(
                      color: AppColors.black.withValues(alpha: 0.6),
                      blurRadius: 8.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ],
    );
  }
}
