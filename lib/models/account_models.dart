class AccountModel {
  final String username;
  final String password;
  AccountModel({required this.username, required this.password});

  bool isLogin() {
    if (username == "admin" && password == "admin") {
      return true;
    } else {
      return false;
    }
  }
}
