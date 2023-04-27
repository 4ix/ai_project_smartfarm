class ExternalModel {
  late final dynamic temperature,
      humidity,
      weather,
      windDirection,
      windSpeed,
      sunrise,
      sunset;

  ExternalModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        humidity = json['humidity'],
        weather = json['weather'],
        windDirection = json['wind_direction'],
        windSpeed = json['wind_speed'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];
}
