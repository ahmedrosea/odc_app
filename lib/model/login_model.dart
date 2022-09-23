class LoginModel {
  String? code;
  String? message;
  String? accessToken;

  LoginModel(
      {required this.code, required this.message, required this.accessToken});
  LoginModel.fromJson(Map<String, dynamic> jsonData) {
    code = jsonData['code'];
    message = jsonData['message'];
    accessToken = jsonData['data']['accessToken'];
  }
}
