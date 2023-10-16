import 'package:flutter_clean_architecture_sample/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/entities/ArticleEntity.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements BaseUseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.saveArticle(params!);
  }
}