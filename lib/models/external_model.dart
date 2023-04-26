class ExternalModel {
  late final temperature, humidity, weather, wind_direction, wind_speed;

  ExternalModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temerature'],
        humidity = json['humidity'],
        weather = json['weater'],
        wind_direction = json['wind_direction'],
        wind_speed = json['wind_speed'];
}
