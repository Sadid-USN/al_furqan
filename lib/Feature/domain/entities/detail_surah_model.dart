import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:al_furqan/Feature/domain/entities/edition_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_surah_model.g.dart';

@JsonSerializable()
class DetailSurahModel {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<AyahsModel>? ayahs;
  EditionModel? edition;

  DetailSurahModel(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.numberOfAyahs,
      this.ayahs,
      this.edition});

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) =>
      _$DetailSurahModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailSurahModelToJson(this);
}
