import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:al_furqan/Feature/domain/usecases/detail_of_surah.dart';
import 'package:al_furqan/Feature/presentation/bloc/detailSurahCubit/detail_surah_list_state.dart';
import 'package:al_furqan/Feature/presentation/bloc/surahCubit/surah_list_state.dart';
import 'package:al_furqan/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class DetailSurahListCubit extends Cubit<DetailCubitSurahState> {
  final GetDetailSurah getDetailSurahs;
  DetailSurahListCubit({required this.getDetailSurahs})
      : super(DetailCubitSurahEmpty());
  int page = 1;
  void detaiLoadSurah() async {
    if (state is SurahLoading) return;
    final currentState = state;

    var emptySurahs = <AyahsModel>[];

    if (currentState is DetailCubitSurahsLoaded) {
      emptySurahs = currentState.details;
    }

    emit(DetailCubitSurahsLoading(emptySurahs, isFirstFatch: page == 1));

    final failureOrSurah =
        await getDetailSurahs(const DetailSurahParams(page: 1));

    failureOrSurah.fold(
        (failure) =>
            emit(DetailCubitDataError(message: _mapFailureToMessage(failure))),
        (surah) {
      final surahs = (state as DetailCubitSurahsLoading).detailsSurah;
      surahs.addAll(surah);

      emit(DetailCubitSurahsLoaded(surahs));
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
