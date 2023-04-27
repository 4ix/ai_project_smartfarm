class InternalModel {
  late final dynamic temperature, humidity, soilCo2, soilHumidity;

  InternalModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        humidity = json['humidity'],
        soilCo2 = json['soil_co2'],
        soilHumidity = json['soil_humidity'];
}
