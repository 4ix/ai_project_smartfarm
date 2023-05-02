import 'dart:convert';

import 'package:smartfarm/models/external_model.dart';
import 'package:smartfarm/models/graphs_model.dart';
import 'package:smartfarm/models/internal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // 개발되는 api 주소 넣기
  static const String baseUrl = 'http://172.16.10.57:5000/FARM';
  static const String external = 'MONITORING/EXTERNAL_SENSOR';
  static const String internal = 'MONITORING/INTERNAL_SENSOR';
  static const String humidity = 'MONITORING/INTERNAL_SENSOR/humidity/GRAPH';
  static const String cO2 = 'MONITORING/INTERNAL_SENSOR/CO2/GRAPH';

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

    final url = Uri.parse('$baseUrl/$id/$site/$internal');
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

    final url = Uri.parse('$baseUrl/$id/$site/$humidity');
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

    final url = Uri.parse('$baseUrl/$id/$site/$cO2');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> graphs = jsonDecode(utf8.decode(response.bodyBytes));
      for (var graph in graphs) {
        final instance = GraphModel.fromJson(graph);
        cO2sInstance.add(instance);
      }
      print(cO2sInstance[0].cO2);
      return cO2sInstance;
    }
    throw Error();
  }
}
