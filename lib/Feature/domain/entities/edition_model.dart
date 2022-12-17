import 'package:json_annotation/json_annotation.dart';
part 'edition_model.g.dart';

@JsonSerializable()
class EditionModel {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  EditionModel(
      {this.identifier,
      this.language,
      this.name,
      this.englishName,
      this.format,
      this.type,
      this.direction});

  factory EditionModel.fromJson(Map<String, dynamic> json) =>
      _$EditionModelFromJson(json);
  Map<String, dynamic> toJson() => _$EditionModelToJson(this);
}
