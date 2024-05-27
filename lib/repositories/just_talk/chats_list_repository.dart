import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/chat_model.dart';

class ChatListRepository {
  Future<List<ChatModel>> getChatsList() async {
    final response = await Dio().get("http://192.168.50.193:8082/chats");
    debugPrint(response.toString());
    final data =  response.data as List<dynamic>;
    final dataChats = data.map((e) => ChatModel.fromJson(e)).toList();
    debugPrint(dataChats.toString());
    return dataChats;
  }
}
