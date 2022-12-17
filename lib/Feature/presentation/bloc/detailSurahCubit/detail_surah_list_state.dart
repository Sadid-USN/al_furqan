import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:equatable/equatable.dart';

abstract class DetailCubitSurahState extends Equatable {
  const DetailCubitSurahState();
  @override
  List<Object?> get props => [];
}

class DetailCubitSurahEmpty extends DetailCubitSurahState {
  @override
  List<Object?> get props => [];
}

class DetailCubitSurahsLoading extends DetailCubitSurahState {
  final List<AyahsModel> detailsSurah;
  final bool isFirstFatch;
  const DetailCubitSurahsLoading(this.detailsSurah,
      {this.isFirstFatch = false});

  @override
  List<Object?> get props => [detailsSurah];
}

class DetailCubitSurahsLoaded extends DetailCubitSurahState {
  final List<AyahsModel> details;
  const DetailCubitSurahsLoaded(this.details);
  @override
  List<Object?> get props => [details];
}

class DetailCubitDataError extends DetailCubitSurahState {
  final String message;
  const DetailCubitDataError({required this.message});
  @override
  List<Object?> get props => [message];
}
