import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object?> get props => [];
}

class SurahEmpty extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<BookModel>? surahs;
  const SurahLoaded({this.surahs});

  @override
  List<Object?> get props => [surahs];
}

class SurahSearchError extends SurahState {
  final String message;
  const SurahSearchError({required this.message});
  @override
  List<Object?> get props => [message];
}
