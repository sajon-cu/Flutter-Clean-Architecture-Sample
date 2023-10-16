import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/data/models/ArticleModel.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query("SELECT * FROM article")
  Future<List<ArticleModel>> getArticles();
}