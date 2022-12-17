import 'package:equatable/equatable.dart';

abstract class DeatilSurahEvent extends Equatable {
  const DeatilSurahEvent();

  @override
  List<Object?> get props => [];
}

class TextSurahsEvent extends DeatilSurahEvent {
  final int page;

  const TextSurahsEvent(this.page);
}
