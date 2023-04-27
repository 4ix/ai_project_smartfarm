class InternalModel {
  late final temperature, humidity, soil_temperature, soil_humidity;

  InternalModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        humidity = json['humidity'],
        soil_temperature = json['soil_temperature'],
        soil_humidity = json['soil_humidity'];
}
