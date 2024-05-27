import 'package:just_talk/repositories/just_talk/models/user_model.dart';

class ChatModel {
  final String id;
  final String authorName;
  final String authorUserName;
  final String chatStatus;
  final DateTime createdDate;


  ChatModel({
    required this.id,
    required this.authorName,
    required this.authorUserName,
    required this.chatStatus,
    required this.createdDate});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      authorName: json['authorName'],
      authorUserName: json['authorUserName'],
      chatStatus: json['chatStatus'],
      createdDate: DateTime.parse(json['createdDate']),
    );
  }
}