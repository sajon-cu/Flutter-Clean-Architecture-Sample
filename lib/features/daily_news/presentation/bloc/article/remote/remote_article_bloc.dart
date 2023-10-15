import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_sample/core/resources/data_state.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/domain/usecases/GetArticleUseCase.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    on <GetArticle>(onGetArticle);
  }

  void onGetArticle(GetArticle event, Emitter<RemoteArticleState> emitter) async {
    final dataState = await _getArticleUseCase();

    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if(dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}