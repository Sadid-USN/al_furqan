import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class SurahsRepository {
  Future<Either<Failure, List<BookModel>>> getAllSurahs();

  Future<Either<Failure, List<AyahsModel>>> detailOfSurah(int page);
}
