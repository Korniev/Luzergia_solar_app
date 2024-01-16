import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String> getAccessToken() async {
  const String clientId = '0cbaf87c03500538e6e8038240703601';
  const String clientSecret = '233ce2f8116321f028b97847fbe08a18';

  final credentials =
      const Base64Encoder().convert('$clientId:$clientSecret'.codeUnits);

  debugPrint('Base64 credentials: $credentials');

  final response = await http.post(
    Uri.parse('https://api.enphaseenergy.com/oauth/token'),
    headers: {
      'Authorization': 'Basic $credentials',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'grant_type': 'client_credentials',
    },
  );

  if (response.statusCode == 200) {
    final accessToken = json.decode(response.body)['access_token'];
    debugPrint("$accessToken");
    return accessToken;
  } else {
    throw Exception(
        'Не вдалося отримати токен доступу: ${response.statusCode}');
  }
}
