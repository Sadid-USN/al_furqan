import 'package:al_furqan/Feature/data/datasources/surah_local_datasource.dart';
import 'package:al_furqan/Feature/data/datasources/surahs_remoute_datasource.dart';
import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:al_furqan/Feature/domain/repositories/surahs_repository.dart';
import 'package:al_furqan/core/error/exception.dart';
import 'package:al_furqan/core/platform/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:al_furqan/core/error/failure.dart';

class SurahRepositoryImpl implements SurahsRepository {
  final SurahsRemoutDataSource surahsRemoutDataSource;
  final SurahLocalDtataSource surahLocalDataSource;
  final NetworkInfo networkInfo;
  SurahRepositoryImpl({
    required this.networkInfo,
    required this.surahLocalDataSource,
    required this.surahsRemoutDataSource,
  });
  @override
  Future<Either<Failure, List<BookModel>>> getAllSurahs() async {
    return await _getSurahs(() {
      return surahsRemoutDataSource.getAllSurahs();
    });
  }

  @override
  Future<Either<Failure, List<AyahsModel>>> detailOfSurah(int page) async {
    return await _getDetailSurah(() {
      return surahsRemoutDataSource.detailOfSurah(page);
    });
  }

  Future<Either<Failure, List<BookModel>>> _getSurahs(
      Future<List<BookModel>> Function() getSurah) async {
    if (await networkInfo.isConnected) {
      try {
        final remoutsurah = await getSurah();
        surahLocalDataSource.surahToCache(remoutsurah);
        return Right(remoutsurah);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSurah = await surahLocalDataSource.getLastSurahFromCache();
        return Right(localSurah);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  Future<Either<Failure, List<AyahsModel>>> _getDetailSurah(
      Future<List<AyahsModel>> Function() getSurah) async {
    if (await networkInfo.isConnected) {
      try {
        final remoutsurah = await getSurah();
        surahLocalDataSource.detailsSurahToCache(remoutsurah);
        return Right(remoutsurah);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSurah =
            await surahLocalDataSource.getLastDetailSurahFromCache();
        return Right(localSurah);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
