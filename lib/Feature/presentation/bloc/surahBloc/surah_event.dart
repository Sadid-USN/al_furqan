import 'package:equatable/equatable.dart';

abstract class SurahEvent extends Equatable {
  const SurahEvent();

  @override
  List<Object?> get props => [];
}

class ListSurahsEvent extends SurahEvent {
  final int page;

  const ListSurahsEvent(this.page);
}
