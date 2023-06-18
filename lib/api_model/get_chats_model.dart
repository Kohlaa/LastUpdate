class GetChatsModel {
  final String msg;
  final List<ChatModel> chats;
  final bool status;

  GetChatsModel({
    required this.msg,
    required this.chats,
    required this.status,
  });

  factory GetChatsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> chatsData = json['chats'];
    List<ChatModel> chats = chatsData.map((chat) => ChatModel.fromJson(chat)).toList();

    return GetChatsModel(
      msg: json['msg'],
      chats: chats,
      status: json['status'],
    );
  }
}

class ChatModel {
  final String id;
  final String name;
  final String email;

  ChatModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
