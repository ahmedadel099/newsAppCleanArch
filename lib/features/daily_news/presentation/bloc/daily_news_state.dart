part of 'daily_news_bloc.dart';

abstract class DailyNewsState extends Equatable {
  const DailyNewsState();  

  @override
  List<Object> get props => [];
}
class DailyNewsInitial extends DailyNewsState {}
