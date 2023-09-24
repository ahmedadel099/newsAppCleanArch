import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'daily_news_event.dart';
part 'daily_news_state.dart';

class DailyNewsBloc extends Bloc<DailyNewsEvent, DailyNewsState> {
  DailyNewsBloc() : super(DailyNewsInitial()) {
    on<DailyNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
