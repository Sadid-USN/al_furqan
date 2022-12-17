import 'dart:async';

import 'package:al_furqan/Feature/domain/usecases/get_all_surahs.dart';

import 'package:al_furqan/Feature/presentation/bloc/surahBloc/surah_state.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahBloc/surah_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetAllSurahs surahs;
  SurahBloc({required this.surahs}) : super(SurahEmpty()) {
    on<ListSurahsEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      ListSurahsEvent event, Emitter<SurahState> emit) async {
    emit(SurahLoading());
    final failureOrSurah = await surahs(const SurahParams());
    emit(failureOrSurah.fold(
        (failure) => SurahSearchError(message: _mapFailureToMessage(failure)),
        (surah) => SurahLoaded(surahs: surah)));
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
