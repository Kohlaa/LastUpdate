class LoginModel {
  late final String name;
  late final String email;
  late final bool status;
  late final String id;
  late final String token;

  LoginModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    status = json['status'];
    id = json['id'];
    token = json['token'];
  }
}