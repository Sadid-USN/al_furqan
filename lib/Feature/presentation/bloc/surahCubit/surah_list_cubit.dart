import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:al_furqan/Feature/domain/usecases/get_all_surahs.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahCubit/surah_list_state.dart';
import 'package:al_furqan/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class SurahListCubit extends Cubit<SurahState> {
  final GetAllSurahs getAllSurahs;
  SurahListCubit({required this.getAllSurahs}) : super(SurahEmpty());
  int page = 1;
  void loadSurah() async {
    if (state is SurahLoading) return;
    final currentState = state;

    var emptySurahs = <BookModel>[];

    if (currentState is SurahLoaded) {
      emptySurahs = currentState.surahs;
    }

    emit(SurahLoading(emptySurahs, isFirstFatch: page == 1));

    final failureOrSurah = await getAllSurahs(const SurahParams());

    failureOrSurah.fold(
        (failure) => emit(DataError(message: _mapFailureToMessage(failure))),
        (surah) {
      final surahs = (state as SurahLoading).listofSurahs;
      surahs.addAll(surah);

      emit(SurahLoaded(surahs));
    });
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
