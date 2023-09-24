import 'package:clean_news/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable {

  final List<ArticleEntity> ? article;
  final DioException ?  error ;

  RemoteArticleState({this.article, this.error});
  
  @override
  List<Object> get props => [article! , error!];
}

class RemoteArticleLoading extends RemoteArticleState {
  RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  RemoteArticleDone(List<ArticleEntity> article) :  super(article:article);
}

class RemoteArticleError extends RemoteArticleState{
  RemoteArticleError(DioException error) : super(error: error);
}