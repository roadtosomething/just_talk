import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../repositories/just_talk/message_list_repository.dart';
import '../repositories/just_talk/models/message_model.dart';

class MessageListProvider with ChangeNotifier {
  final MessageListRepository _repository = MessageListRepository();

  List<MessageModel> _messages = [];
  List<MessageModel> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadMessages(String chatId) async {
    _isLoading = true;
    notifyListeners();
    if (kDebugMode) {
      print('Load messages from chat $chatId');
    }
    try {
      _messages = await _repository.getMessageList(chatId);
      if (kDebugMode) {
        print('Load messages from chat $chatId is done');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }} finally {
      _isLoading = false;
      if (kDebugMode) {
        print('Load messages from chat $chatId is failed');
      }
      notifyListeners();
    }
  }
}