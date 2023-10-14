import 'package:flutter_clean_architecture_sample/core/constants/constants.dart';
import 'package:flutter_clean_architecture_sample/core/resources/data_state.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/data/models/ArticleModel.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<DataState<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}