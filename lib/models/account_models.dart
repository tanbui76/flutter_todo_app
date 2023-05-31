class AccountModel {
  final String username;
  final String password;
  AccountModel({required this.username, required this.password});

  //toJSON dùng để lưu vào SharedPreferences (lưu vào bộ nhớ) - chuyển từ object sang JSON
  String toJson() {
    return '{ "username": "$username", "password": "$password" }';
  }

  //fromJSON dùng để lấy dữ liệu từ SharedPreferences (lấy từ bộ nhớ) - chuyển từ JSON sang object
  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(username: json['username'], password: json['password']);
  }
}
