import 'package:flutter/cupertino.dart';
import 'package:just_talk/repositories/just_talk/models/tip_model.dart';
import 'package:dio/dio.dart';

class TipService {

  Future<TipModel> getTips() async {
    Map <String, String> body = {
      "message": "Дай крактий совет на день",
      "api_key": "chad-b134da7412ed4018bc7a3ffe6242bc198711i01b"
    };

    final response = await Dio().post("https://ask.chadgpt.ru/api/public/gpt-3.5", data: body);
    debugPrint(response.toString());

    // Извлекаем JSON из ответа
    final responseData = response.data;

    // Проверяем наличие ключа "response" и создаём TipsModel
    if (responseData != null && responseData['response'] != null) {
      TipModel tip = TipModel.fromJson(responseData);
      debugPrint(tip.toString());

      return tip;
    } else {
      throw Exception("Invalid response from API");
    }
  }
}