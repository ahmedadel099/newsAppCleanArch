import 'package:clean_news/core/resources/data_state.dart';
import 'package:clean_news/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _articleUseCase;

  RemoteArticleBloc(this._articleUseCase) : super(RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _articleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
