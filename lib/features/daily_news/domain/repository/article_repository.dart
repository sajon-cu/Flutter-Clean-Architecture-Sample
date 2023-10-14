import 'package:flutter_clean_architecture_sample/core/resources/data_state.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/entities/ArticleEntity.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}