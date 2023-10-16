import 'package:flutter_clean_architecture_sample/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/entities/ArticleEntity.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUseCase implements BaseUseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}