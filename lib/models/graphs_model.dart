class GraphModel {
  late final dynamic humidity, soilHumidity;
  GraphModel.fromJson(Map<String, dynamic> json)
      : humidity = json['humidity'],
        soilHumidity = json['soil_humidity'];
}
