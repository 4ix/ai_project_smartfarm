import 'dart:convert';

import 'package:smartfarm/models/external_model.dart';
import 'package:smartfarm/models/graphs_model.dart';
import 'package:smartfarm/models/internal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // 개발되는 api 주소 넣기
  static const String baseUrl = 'http://43.201.161.172:5000/FARM';
  static const String external = 'MONITORING/EXTERNAL_SENSOR';
  static const String internal = 'MONITORING/INTERNAL_SENSOR';
  static const String humidity = 'humidity/GRAPH';
  static const String cO2 = 'CO2/GRAPH';
  static const String etc1 = 'CONTROL/ETC/ETC_1';
  static const String etc2 = 'CONTROL/ETC/ETC_2';
  static const String etc3 = 'CONTROL/ETC/ETC_3';

  static Future<List<String>> getSites(id) async {
    final url = Uri.parse('$baseUrl/$id/sites');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final siteIds = List<String>.from(json['site_ids']);
      return siteIds;
    } else {
      throw Exception('사이트 로드 실패');
    }
  }

  static Future<List<ExternalModel>> getExternals(id, site) async {
    List<ExternalModel> externalsInstance = [];

    final url = Uri.parse('$baseUrl/$id/$site/$external');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> externals =
          jsonDecode(utf8.decode(response.bodyBytes));
      for (var external in externals) {
        final instance = ExternalModel.fromJson(external);
        externalsInstance.add(instance);
      }
      return externalsInstance;
    }
    throw Error();
  }

  static Future<List<InternalModel>> getInternals(id, site) async {
    List<InternalModel> internalsInstance = [];

    final url = Uri.parse('$baseUrl/$id/$site/$internal'); // 외부 api 주소로 바꿔야함
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> externals =
          jsonDecode(utf8.decode(response.bodyBytes));
      for (var external in externals) {
        final instance = InternalModel.fromJson(external);
        internalsInstance.add(instance);
      }
      return internalsInstance;
    }
    throw Error();
  }

  static Future<List<GraphModel>> getHumiditis(id, site) async {
    List<GraphModel> humiditiesInstance = [];

    final url = Uri.parse('$baseUrl/$id/$site/$internal/$humidity');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> graphs = jsonDecode(utf8.decode(response.bodyBytes));
      for (var graph in graphs) {
        final instance = GraphModel.fromJson(graph);
        humiditiesInstance.add(instance);
      }
      return humiditiesInstance;
    }
    throw Error();
  }

  static Future<List<GraphModel>> getCO2s(id, site) async {
    List<GraphModel> cO2sInstance = [];

    final url = Uri.parse('$baseUrl/$id/$site/$internal/$cO2');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> graphs = jsonDecode(utf8.decode(response.bodyBytes));
      for (var graph in graphs) {
        final instance = GraphModel.fromJson(graph);
        cO2sInstance.add(instance);
      }
      return cO2sInstance;
    }
    throw Error();
  }

  static Future<String> getEtc1(id, site, status) async {
    final url = Uri.parse('$baseUrl/$id/$site/$etc1');
    final response = await http.post(
      url,
      body: {'status': status},
    );
    return response.body;
  }

  static Future<String> getEtc2(id, site, status) async {
    final url = Uri.parse('$baseUrl/$id/$site/$etc2');
    final response = await http.post(
      url,
      body: {'status': status},
    );
    return response.body;
  }

  static Future<String> getEtc3(id, site, status) async {
    final url = Uri.parse('$baseUrl/$id/$site/$etc3');
    final response = await http.post(
      url,
      body: {'status': status},
    );
    // print(response.body);
    return response.body;
  }
}
