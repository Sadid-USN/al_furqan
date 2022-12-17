// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurahModel _$DetailSurahModelFromJson(Map<String, dynamic> json) =>
    DetailSurahModel(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => AyahsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      edition: json['edition'] == null
          ? null
          : EditionModel.fromJson(json['edition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailSurahModelToJson(DetailSurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'numberOfAyahs': instance.numberOfAyahs,
      'ayahs': instance.ayahs,
      'edition': instance.edition,
    };
