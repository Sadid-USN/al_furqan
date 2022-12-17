import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'surahs_model.g.dart';

@JsonSerializable()
class SurahsModel {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<AyahsModel>? ayahs;

  SurahsModel(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.ayahs});

  factory SurahsModel.fromJson(Map<String, dynamic> json) =>
      _$SurahsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurahsModelToJson(this);
}
