class UsersModel {
  late final String id, password, username, email, sites;

  UsersModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'],
        username = json['username'],
        email = json['email'],
        sites = json['sites'];
}
