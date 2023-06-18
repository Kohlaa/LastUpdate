
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  String? email;
  String? id;
  bool? status;
  String? lastImg;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    status = json['status'];
    lastImg = json['lastImg'];
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "id": id,
    "status": status,
    "lastImg": lastImg,
  };

}

// class UserModel {

//   late final String name;
//   late final String email;
//   late final String id;
//   late final bool status;
//
//   UserModel.fromJson(Map<String, dynamic> json){
//     name = json['name'];
//     email = json['email'];
//     id = json['id'];
//     status = json['status'];
//   }

// }
