import 'dart:convert';

import 'package:al_furqan/Feature/domain/entities/ayahs_model.dart';
import 'package:al_furqan/Feature/domain/entities/book_entity.dart';
import 'package:al_furqan/core/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class SurahsRemoutDataSource {
  //? Endpoint all Surahs http://api.alquran.cloud/v1/surah

  //? Endpoint search text of Syrah http://api.alquran.cloud/v1/surah/$page/ru.kuliev

  Future<List<BookModel>> getAllSurahs();

  Future<List<AyahsModel>> detailOfSurah(int page);
}

class SurahsRemoutDataSourceImpl implements SurahsRemoutDataSource {
  final http.Client client;
  SurahsRemoutDataSourceImpl({required this.client});
  @override
  Future<List<BookModel>> getAllSurahs() =>
      _getSurahFromUrl('http://api.alquran.cloud/v1/surah');

  @override
  Future<List<AyahsModel>> detailOfSurah(int number) =>
      _getDetailOfSurahFromUrl(
          'http://api.alquran.cloud/v1/surah/$number/ru.kuliev');

  Future<List<BookModel>> _getSurahFromUrl(String url) async {
    print(url);
    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final surahs = json.decode(response.body);

      return (surahs['data'] as List)
          .map((saurah) => BookModel.fromJson(saurah))
          .toList();
    } else {
      throw ServerException();
    }
  }

  Future<List<AyahsModel>> _getDetailOfSurahFromUrl(String url) async {
    print(url);
    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final surahs = json.decode(response.body);

      return (surahs['data'] as List)
          .map((saurah) => AyahsModel.fromJson(saurah))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
