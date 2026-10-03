import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/main_screen/tabs/home/data/models/movie.dart';
import 'package:movies/features/main_screen/tabs/home/data/models/movies_response_model.dart';
import '../../../../../../core/api/api_manager.dart';
import '../../../../../../core/constants/api_constants.dart';

@Injectable(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiManager apiManager;

  MovieRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await apiManager.get(ApiConstants.moviesListEndpoint);
      final moviesResponse = MoviesResponseModel.fromJson(response.data);
      return moviesResponse.data?.movies ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
