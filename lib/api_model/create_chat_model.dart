class CreateChatModel {
  final String msg;
  final bool status;

  CreateChatModel({required this.msg, required this.status});

  factory CreateChatModel.fromJson(Map<String, dynamic> json) {
    return CreateChatModel(
      msg: json['msg'],
      status: json['status'],
    );
  }
}
