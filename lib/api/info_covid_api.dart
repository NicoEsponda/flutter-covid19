import 'package:dio/dio.dart';
import 'package:flutter_covid19/models/info_covid.dart';
import 'dart:async';

class CovidApi {
  CovidApi._internal();
  static final CovidApi _instance = CovidApi._internal();
  static CovidApi get instance => _instance;

  final String url = 'https://api.covid19api.com/summary';

  final _dio = Dio();

  Future<List<Country>> getPaises() async {
    final Response response = await _dio.get(url, queryParameters: {});

    return (response.data['Countries'] as List)
        .map((e) => Country.fromJson(e))
        .toList();
  }
}
