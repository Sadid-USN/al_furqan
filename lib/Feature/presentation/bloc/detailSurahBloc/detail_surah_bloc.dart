import 'dart:async';

import 'package:al_furqan/Feature/domain/usecases/detail_of_surah.dart';
import 'package:al_furqan/Feature/presentation/bloc/detailSurahBloc/detail_surah_event.dart';
import 'package:al_furqan/Feature/presentation/bloc/detailSurahBloc/detail_surah_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class DetailSurahBloc extends Bloc<DeatilSurahEvent, DetailSurahBlocState> {
  final GetDetailSurah detail;
  DetailSurahBloc({required this.detail}) : super(DetailBlocSurahEmpty()) {
    on<DeatilSurahEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      DeatilSurahEvent event, Emitter<DetailSurahBlocState> emit) async {
    emit(DetailsSurahLoading());
    final failureOrSurah = await detail(const DetailSurahParams(page: 1));
    emit(failureOrSurah.fold(
        (failure) => DetailSurahError(message: _mapFailureToMessage(failure)),
        (detail) => DetailsSurahLoaded(details: detail)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
