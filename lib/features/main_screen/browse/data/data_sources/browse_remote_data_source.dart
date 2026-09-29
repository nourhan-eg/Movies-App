 import 'package:dartz/dartz.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/main_screen/home/data/models/movie.dart';

abstract class BrowseRemoteDataSource {

  Future<List<Movie>> getMoviesByGenre(String genre);

}