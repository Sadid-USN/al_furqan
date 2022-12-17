import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:equatable/equatable.dart';

abstract class DetailSurahBlocState extends Equatable {
  const DetailSurahBlocState();

  @override
  List<Object?> get props => [];
}

class DetailBlocSurahEmpty extends DetailSurahBlocState {}

class DetailsSurahLoading extends DetailSurahBlocState {}

class DetailsSurahLoaded extends DetailSurahBlocState {
  final List<AyahsModel>? details;
  const DetailsSurahLoaded({this.details});

  @override
  List<Object?> get props => [details];
}

class DetailSurahError extends DetailSurahBlocState {
  final String message;
  const DetailSurahError({required this.message});
  @override
  List<Object?> get props => [message];
}
