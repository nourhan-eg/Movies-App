import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../main_screen/tabs/home/data/models/movie.dart';
import '../../../main_screen/tabs/home/data/models/movies_response_model.dart';
import '../models/movie_details_model.dart';
import 'movie_details_remote_data_source.dart';

@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final ApiManager apiManager;

  MovieDetailsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await apiManager.get(
      ApiConstants.moviesDetails,
      queryParameters: {
        'movie_id': movieId,
        'with_images': true,
        'with_cast': true,
      },
    );

    final data = response.data['data'];
    if (data != null && data['movie'] != null) {
      return MovieDetailsModel.fromJson(data['movie']);
    } else {
      throw Exception('Movie details not found');
    }
  }

  @override
  Future<List<Movie>> getMovieSuggestions(int movieId) async {
    final response = await apiManager.get(
      ApiConstants.moviesSuggestion,
      queryParameters: {
        'movie_id': movieId,
      },
    );

    final moviesResponse = MoviesResponseModel.fromJson(response.data);
    return moviesResponse.data?.movies ?? [];
  }
}
