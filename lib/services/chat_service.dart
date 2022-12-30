import 'dart:convert';
import 'dart:developer';

import 'package:flutter_chat_gpt/utils/constants.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<Map<String, dynamic>?> sendMessaage(String message) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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',
        },
        body: jsonEncode({
          'model': "text-davinci-003",
          'prompt': message,
          'max_tokens': 150,
        }),
      );
      // log(response.body);
      if (response.statusCode != 200) throw "Something went wrong";
      Map<String, dynamic> res = json.decode(response.body);
      return res;
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
