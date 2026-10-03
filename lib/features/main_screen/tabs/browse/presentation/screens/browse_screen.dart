import 'package:flutter/material.dart';

import 'package:movies/core/app_colors.dart';

import 'genre_tab.dart';

const List<String> kGenres = [
  'Action',
  'Adventure',
  'Animation',
  'Biography',
  'Comedy',
  'Crime',
  'Drama',
  'Fantasy',
  'Horror',
  'Romance',
  'Sci-Fi',
  'Thriller',
];

class BrowseScreen extends StatefulWidget {
  static const routeName = 'browse route';

  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kGenres.length,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 10),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicator: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: AppColors.yellow,
                labelStyle: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: .w700),
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                tabs: kGenres
                    .map(
                      (genre) => Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.yellow,
                              width: 1.5,
                            ),
                          ),
                          child: Text(genre),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: kGenres
                    .map((genre) => GenreTab(genre: genre))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
