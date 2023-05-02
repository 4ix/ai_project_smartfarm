class ExternalModel {
  late final dynamic temperature, humidity, weather, windDirection, windSpeed;
  ExternalModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        humidity = json['humidity'],
        weather = json['weather'],
        windDirection = json['wind_dir'],
        windSpeed = json['wind_speed'];
}
