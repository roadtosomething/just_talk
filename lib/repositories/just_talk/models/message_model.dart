class MessageModel {
  final String id;
  final String sender;
  final String receiver;
  final String chatId;
  final String text;
  final DateTime timestamp;


  MessageModel({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.chatId,
    required this.text,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      sender: json['sender'],
      receiver: json['receiver'],
      chatId: json['chatId'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}