import 'package:injectable/injectable.dart';
import 'package:movies/features/main_screen/tabs/home/data/models/movie.dart';
import 'package:movies/features/main_screen/tabs/search/data/data_sources/search_movies_data_source.dart';

import '../../../../../../core/api/api_manager.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../home/data/models/movies_response_model.dart';

@Injectable(as: SearchMoviesDataSource)
class SearchMoviesDataSourceImpl implements SearchMoviesDataSource {

  final ApiManager apiManager;

  SearchMoviesDataSourceImpl(this.apiManager);

  @override
  Future<List<Movie>> searchMovies(String query) async {

    try {
      final response = await apiManager.get(
        ApiConstants.moviesListEndpoint,
        queryParameters: {'query_term': query},
      );
      var moviesResponse = MoviesResponseModel.fromJson(response.data);
      return moviesResponse.data!.movies??[];
    }  catch (e) {
      rethrow;
    }



  }
}
