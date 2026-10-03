import 'package:flutter/material.dart';
import '../../../../../../core/app_colors.dart';
import '../../../../../../core/widgets/movie_card.dart';
import '../../../home/domain/entities/movie_entity.dart';
import 'package:movies/features/movie_details/presentation/screens/movie_details_screen.dart';

class ProfileMoviesGrid extends StatelessWidget {
  final List<MovieEntity> movies;
  final bool isEmpty;

  const ProfileMoviesGrid({
    super.key,
    required this.movies,
    this.isEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isEmpty || movies.isEmpty) {
      return const _EmptyMoviesState();
    }
    return _MoviesGridView(movies: movies);
  }
}

class _MoviesGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const _MoviesGridView({required this.movies});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 4 : 3;
    final spacing = 8.0;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 0.67,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(
          movie: movies[index],
          onTap: () => MovieDetailsScreen.open(context, movies[index]),
        );
      },
    );
  }
}

class _EmptyMoviesState extends StatelessWidget {
  const _EmptyMoviesState();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.35,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Popcorn icon using emoji or icon
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const _PopcornIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom-drawn popcorn icon that matches the design in the screenshot
class _PopcornIcon extends StatelessWidget {
  const _PopcornIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: _PopcornPainter(),
    );
  }
}

class _PopcornPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final yellow = Paint()..color = AppColors.yellow;
    final white = Paint()..color = AppColors.white;

    final cx = size.width / 2;
    final cy = size.height / 2;

    // ─── Popcorn bucket body ───
    final bucketRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(cx - 6, cy + 14), width: 42, height: 32),
      const Radius.circular(4),
    );
    canvas.drawRRect(bucketRect, yellow);

    // Vertical stripes on bucket
    final stripePaint = Paint()..color = const Color(0xFFCC8800);
    for (int i = 0; i < 3; i++) {
      canvas.drawRect(
        Rect.fromLTWH(cx - 20 + (i * 14), cy, 6, 28),
        stripePaint,
      );
    }

    // White stripe highlight
    canvas.drawRect(
      Rect.fromLTWH(cx - 6, cy, 4, 28),
      white,
    );

    // ─── Drink cup ───
    final cupPaint = Paint()..color = const Color(0xFF888888);
    final cupPath = Path();
    final cupLeft = cx + 12.0;
    final cupTop = cy + 4.0;
    cupPath.moveTo(cupLeft, cupTop);
    cupPath.lineTo(cupLeft + 18, cupTop);
    cupPath.lineTo(cupLeft + 14, cupTop + 26);
    cupPath.lineTo(cupLeft + 4, cupTop + 26);
    cupPath.close();
    canvas.drawPath(cupPath, cupPaint);

    // Straw
    final strawPaint = Paint()
      ..color = AppColors.yellow
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(cupLeft + 14, cupTop - 4),
      Offset(cupLeft + 18, cupTop + 8),
      strawPaint,
    );

    // ─── Popcorn pieces ───
    _drawPopcornPiece(canvas, yellow, Offset(cx - 22, cy - 18), 10);
    _drawPopcornPiece(canvas, yellow, Offset(cx - 8, cy - 24), 9);
    _drawPopcornPiece(canvas, yellow, Offset(cx + 6, cy - 20), 10);
    _drawPopcornPiece(canvas, white, Offset(cx - 16, cy - 14), 8);
    _drawPopcornPiece(canvas, white, Offset(cx + 2, cy - 14), 8);
  }

  void _drawPopcornPiece(Canvas canvas, Paint paint, Offset center, double r) {
    canvas.drawCircle(center, r, paint);
    canvas.drawCircle(center.translate(r * 0.7, -r * 0.3), r * 0.7, paint);
    canvas.drawCircle(center.translate(-r * 0.6, -r * 0.4), r * 0.65, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
