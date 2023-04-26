class ExternalModel {
  late final temperature, humidity, weather, wind_direction, wind_speed;

  ExternalModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        humidity = json['humidity'],
        weather = json['weather'],
        wind_direction = json['wind_direction'],
        wind_speed = json['wind_speed'];
}
