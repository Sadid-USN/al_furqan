import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:al_furqan/Feature/domain/repositories/surahs_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import 'helper/usecase.dart';

class GetDetailSurah extends UseCase<List<AyahsModel>, DetailSurahParams> {
  final SurahsRepository surahsRepository;
  GetDetailSurah(this.surahsRepository);

  @override
  Future<Either<Failure, List<AyahsModel>>> call(
      DetailSurahParams params) async {
    return await surahsRepository.detailOfSurah(params.page);
  }
}

class DetailSurahParams extends Equatable {
  final int page;
  const DetailSurahParams({required this.page});
  @override
  List<Object?> get props => [page];
}
