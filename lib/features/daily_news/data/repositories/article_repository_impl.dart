import 'dart:io';

import 'package:clean_news/core/constants/constants.dart';
import 'package:clean_news/core/resources/data_state.dart';
import 'package:clean_news/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:clean_news/features/daily_news/data/models/article.dart';
import 'package:clean_news/features/daily_news/domain/entities/article.dart';
import 'package:clean_news/features/daily_news/domain/repositories/article_repo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

class ArticleRepoositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepoositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final HttpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsApiKey, country: categoryQuery, category: categoryQuery);
      if (HttpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(HttpResponse.data);
      } else {
        return DataFailed(DioException(
          requestOptions: HttpResponse.response.requestOptions,
          error: HttpResponse.response.statusMessage,
          response: HttpResponse.response,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
