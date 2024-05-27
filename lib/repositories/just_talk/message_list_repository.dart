import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/message_model.dart';
import 'package:just_talk/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageListRepository {

  final Dio _dio = Dio();
  late String bearer= '';

  Future<List<MessageModel>> getMessageList(String chatId) async {
    String requestApi = 'http://192.168.50.193:8082/chat/messages/$chatId';

    if (kDebugMode) {
      print('Sent response to $requestApi');
    }
    AuthService().getToken().then((token){
      if (token != null) {
        if (kDebugMode) {
          print('Token: $token');
        }
        bearer=token;
      } else {
        if (kDebugMode) {
          print('Token not found');
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error getting token: $error');
      }
    });
    Map<String,dynamic> headers={
      'Authorization': 'Bearer $bearer'
    };
    _dio.options.headers.addAll(headers);
    final response = await _dio.get(requestApi);
    debugPrint(response.toString());
    final data =  response.data as List<dynamic>;
    final dataMessages = data.map((e) => MessageModel.fromJson(e)).toList();
    debugPrint(dataMessages.toString());
    return dataMessages;
  }



}
