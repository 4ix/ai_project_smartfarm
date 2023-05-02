class GraphModel {
  late final dynamic humidity, cO2;
  GraphModel.fromJson(Map<String, dynamic> json)
      : humidity = json['humidity'],
        cO2 = json['CO2'];
}
