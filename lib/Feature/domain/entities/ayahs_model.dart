import 'package:json_annotation/json_annotation.dart';
part 'ayahs_model.g.dart';

@JsonSerializable()
class AyahsModel {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  AyahsModel(
      {this.number,
      this.text,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda});
  factory AyahsModel.fromJson(Map<String, dynamic> json) =>
      _$AyahsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AyahsModelToJson(this);
}
