import 'package:dartz/dartz.dart';
import 'package:movies/failure.dart';
import 'package:movies/features/main_screen/browse/data/data_sources/browse_remote_data_source.dart';
import 'package:movies/features/main_screen/home/data/models/movie.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../home/data/models/movies_response_model.dart';

class BrowseRemoteDataSourceImpl implements BrowseRemoteDataSource {

  final ApiManager apiManager;

  BrowseRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<Movie>> getMoviesByGenre(String genre) async {
    try {
      var response = await apiManager.get(ApiConstants.moviesListEndpoint,
        queryParameters: {'genre':genre , 'limit':20}
      );
      var moviesResponse = MoviesResponseModel.fromJson(response.data);
      return moviesResponse.data!.movies!;
    }
    catch(e){
      rethrow;
    }
  }

}