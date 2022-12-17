// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surahs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahsModel _$SurahsModelFromJson(Map<String, dynamic> json) => SurahsModel(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => AyahsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahsModelToJson(SurahsModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'ayahs': instance.ayahs,
    };
