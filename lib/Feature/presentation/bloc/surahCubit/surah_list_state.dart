import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

abstract class SurahState extends Equatable {
  const SurahState();
  @override
  List<Object?> get props => [];
}

class SurahEmpty extends SurahState {
  @override
  List<Object?> get props => [];
}

class SurahLoading extends SurahState {
  final List<BookModel> listofSurahs;
  final bool isFirstFatch;
  const SurahLoading(this.listofSurahs, {this.isFirstFatch = false});

  @override
  List<Object?> get props => [listofSurahs];
}

class SurahLoaded extends SurahState {
  final List<BookModel> surahs;
  const SurahLoaded(this.surahs);
  @override
  List<Object?> get props => [surahs];
}

class DataError extends SurahState {
  final String message;
  const DataError({required this.message});
  @override
  List<Object?> get props => [message];
}
