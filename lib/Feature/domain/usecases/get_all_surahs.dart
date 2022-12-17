import 'package:al_furqan/Feature/domain/repositories/surahs_repository.dart';
import 'package:al_furqan/Feature/domain/usecases/helper/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../entities/book_entity.dart';

class GetAllSurahs extends UseCase<List<BookModel>, SurahParams> {
  final SurahsRepository surahsRepository;
  GetAllSurahs(this.surahsRepository);

  @override
  Future<Either<Failure, List<BookModel>>> call(SurahParams params) async {
    return await surahsRepository.getAllSurahs();
  }
}

class SurahParams extends Equatable {
  const SurahParams();
  @override
  List<Object?> get props => [];
}
