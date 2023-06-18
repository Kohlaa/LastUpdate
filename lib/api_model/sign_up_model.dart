class SignUpModel {
  SignUpModel({
    required this.name,
    required this.email,
    required this.status,
    required this.images,
    required this.lastImg,
    required this.id,
  });
  late final String name;
  late final String email;
  late final bool status;
  late final List<dynamic> images;
  late final String lastImg;
  late final String id;

  SignUpModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    status = json['status'];
    images = List.castFrom<dynamic, dynamic>(json['images']);
    lastImg = json['lastImg'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['status'] = status;
    _data['images'] = images;
    _data['lastImg'] = lastImg;
    _data['id'] = id;
    return _data;
  }
}