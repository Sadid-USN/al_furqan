import 'dart:convert';

import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:al_furqan/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/ayahs_model.dart';

const String chachedSurah = 'chached_surah';
const String chachedDetailSurah = 'chached_detail_surah';

abstract class SurahLocalDtataSource {
  Future<List<BookModel>> getLastSurahFromCache();
  Future<List<AyahsModel>> getLastDetailSurahFromCache();

  Future<void> surahToCache(List<BookModel> surahs);
  Future<void> detailsSurahToCache(List<AyahsModel> details);
}

class SurahLocalDataSourceImpl implements SurahLocalDtataSource {
  final SharedPreferences sharedPreferences;
  SurahLocalDataSourceImpl({required this.sharedPreferences});
  //? медот getLastSurahFromCache возвращает нам ранее закешированные данные
  //? из surahToCache
  @override
  Future<List<BookModel>> getLastSurahFromCache() {
    final jsonSurahList = sharedPreferences.getStringList(chachedSurah);
    if (jsonSurahList!.isNotEmpty) {
      return Future.value(jsonSurahList
          .map((surah) => BookModel.fromJson(json.decode(surah)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> surahToCache(List<BookModel> surahs) {
    final List<String> jsonSurahsList =
        surahs.map((surah) => json.encode(surah.toJson())).toList();

    sharedPreferences.setStringList(chachedSurah, jsonSurahsList);
    print('<======= Surah Successfully Cached =====> ${jsonSurahsList.length}');
    return Future.value(jsonSurahsList);
  }

  @override
  Future<List<String>> detailsSurahToCache(List<AyahsModel> details) {
    final List<String> jsonSurahsDetailList =
        details.map((surah) => json.encode(surah.toJson())).toList();

    sharedPreferences.setStringList(chachedSurah, jsonSurahsDetailList);
    print(
        '<======= Surah Details Successfully Cached =====> ${jsonSurahsDetailList.length}');
    return Future.value(jsonSurahsDetailList);
  }

  @override
  Future<List<AyahsModel>> getLastDetailSurahFromCache() {
    final jsonSurahList = sharedPreferences.getStringList(chachedDetailSurah);
    if (jsonSurahList!.isNotEmpty) {
      return Future.value(jsonSurahList
          .map((surah) => AyahsModel.fromJson(json.decode(surah)))
          .toList());
    } else {
      throw CacheException();
    }
  }
}
