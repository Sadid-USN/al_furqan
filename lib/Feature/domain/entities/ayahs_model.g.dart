// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayahs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahsModel _$AyahsModelFromJson(Map<String, dynamic> json) => AyahsModel(
      number: json['number'] as int?,
      text: json['text'] as String?,
      numberInSurah: json['numberInSurah'] as int?,
      juz: json['juz'] as int?,
      manzil: json['manzil'] as int?,
      page: json['page'] as int?,
      ruku: json['ruku'] as int?,
      hizbQuarter: json['hizbQuarter'] as int?,
      sajda: json['sajda'] as bool?,
    );

Map<String, dynamic> _$AyahsModelToJson(AyahsModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };
