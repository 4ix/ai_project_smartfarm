class UsersModel {
  late final String id, username, email;

  UsersModel.fromJson(Map<String, dynamic> json)
      : id = json['user_id'],
        username = json['user_name'],
        email = json['e_mail'];
}
