import 'package:flutter_clean_architecture_sample/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/usecases/GetArticleUseCase.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/daily_news/data/data_sources/local/app_database.dart';
import 'features/daily_news/domain/usecases/save_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database').build();
  sl.registerSingleton<AppDatabase>(database);


  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));
  
  // Use-cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  
  // Blocs
  sl.registerFactory<RemoteArticleBloc>(
          () => RemoteArticleBloc(sl())
  );
}