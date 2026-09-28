import 'package:dio/dio.dart';
import 'package:movies/features/main_screen/home/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/main_screen/home/data/models/movie.dart';
import 'package:movies/features/main_screen/home/data/models/movies_response_model.dart';

import '../../../../../core/constants/api_constants.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<List<Movie>> getMovies() async {
   try{
     var response = await dio.get(ApiConstants.baseUrl + ApiConstants.moviesListEndpoint);
    var moviesResponse= MoviesResponseModel.fromJson(response.data);
     return moviesResponse.data!.movies!;
   }catch(e){
     rethrow;
   }
  }
  }
