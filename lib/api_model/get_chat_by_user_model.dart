class GetChatByUserModel {
  final String msg;
  final List<ChatMessageModel> chats;
  final bool status;

  GetChatByUserModel({
    required this.msg,
    required this.chats,
    required this.status,
  });

  factory GetChatByUserModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> chatsData = json['Messages'];
    List<ChatMessageModel> chats = chatsData
        .map((chat) => ChatMessageModel.fromJson(chat))
        .toList();

    return GetChatByUserModel(
      msg: json['msg'],
      chats: chats,
      status: json['status'],
    );
  }
}

class ChatMessageModel {
  final String msg;
  final String sender;
  final String receiver;

  ChatMessageModel({
    required this.msg,
    required this.sender,
    required this.receiver,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      msg: json['msg'],
      sender: json['sender'],
      receiver: json['receiver'],
    );
  }
}
