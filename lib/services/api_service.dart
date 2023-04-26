import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:smartfarm/models/external_model.dart';
// import 'package:http/http.dart' as http;

import 'package:smartfarm/models/users_model.dart';

class ApiService {
  // 개발되는 api 주소 넣기
  static const String baseUrl = 'http://192.168.0.123';
  static const String login = 'login';

  static Future<List<UsersModel>> getUsers() async {
    List<UsersModel> usersInstance = [];

    // 더미 Json 긁어오는 방법
    String jsonString = await rootBundle.loadString('assets/json/users.json');
    final jsonResponse = json.decode(jsonString);
    for (var user in jsonResponse) {
      final instance = UsersModel.fromJson(user);
      usersInstance.add(instance);
    }
    return usersInstance;

    // // 실제 API 긁어오는 방법
    // final url = Uri.parse('$baseUrl/$login');
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   final List<dynamic> users = jsonDecode(response.body);
    //   for (var user in users) {
    //     final instance = UsersModel.fromJson(user);
    //     usersInstance.add(instance);
    //   }
    //   return usersInstance;
    // }
    // throw Error();
  }

  static Future<List<ExternalModel>> getExternals() async {
    List<ExternalModel> usersInstance = [];

    // 더미 Json 긁어오는 방법
    String jsonString =
        await rootBundle.loadString('assets/json/externals.json');
    final jsonResponse = json.decode(jsonString);
    for (var user in jsonResponse) {
      final instance = ExternalModel.fromJson(user);
      usersInstance.add(instance);
    }
    return usersInstance;
  }
}
