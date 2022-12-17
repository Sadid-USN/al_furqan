// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      number: json['number'] as int?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      numberOfAyahs: json['numberOfAyahs'] as int?,
      revelationType: json['revelationType'] as String?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': instance.revelationType,
    };
