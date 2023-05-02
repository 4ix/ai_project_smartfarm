import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smartfarm/models/external_model.dart';
import 'package:smartfarm/models/internal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // 개발되는 api 주소 넣기
  static const String baseUrl = 'http://172.16.10.57:5000/FARM';
  static const String external = 'MONITORING/EXTERNAL_SENSOR';

  static const String baseLogin = 'http://172.16.10.57:5000/farm/v1/login';

  static Future<List<String>> getSites(id) async {
    final url = Uri.parse('$baseUrl/$id/sites');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final siteIds = List<String>.from(json['site_ids']);
      return siteIds;
    } else {
      throw Exception('Failed to load sites');
    }
  }

  static Future<List<ExternalModel>> getExternals() async {
    List<ExternalModel> externalsInstance = [];

    // 더미 Json 긁어오는 방법
    String jsonString =
        await rootBundle.loadString('assets/json/externals.json');
    final jsonResponse = json.decode(jsonString);
    for (var external in jsonResponse) {
      final instance = ExternalModel.fromJson(external);
      externalsInstance.add(instance);
    }
    return externalsInstance;

    // // 실제 API 긁어오는 방법 (External)
    // final url = Uri.parse('$baseUrl/$external');
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   final List<dynamic> externals = jsonDecode(response.body);
    //   for (var external in externals) {
    //     final instance = ExternalModel.fromJson(external);
    //     externalsInstance.add(instance);
    //   }
    //   return externalsInstance;
    // }
    // throw Error();
  }

  static Future<List<InternalModel>> getInternals() async {
    List<InternalModel> internalsInstance = [];

    // 더미 Json 긁어오는 방법
    String jsonString =
        await rootBundle.loadString('assets/json/internals.json');
    final jsonResponse = json.decode(jsonString);
    for (var internal in jsonResponse) {
      final instance = InternalModel.fromJson(internal);
      internalsInstance.add(instance);
    }
    return internalsInstance;
  }
}
