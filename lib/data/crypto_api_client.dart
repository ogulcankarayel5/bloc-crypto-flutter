import 'dart:convert';

import 'package:bloc_crypto/models/crypto.dart';
import 'package:bloc_crypto/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CryptoApiClient {
  static const apiUrl = baseUrl+cmcProApiKey;

  final http.Client httpClient = http.Client();

  Future<Crypto> getCrypto() async {
    final url=apiUrl;
    final cryptoResponse = await httpClient.get(url);
    if (cryptoResponse.statusCode != 200) {
      throw Exception("Crypto para birimleri getirilemedi");
    }

    final cryptoJsonResponse = json.decode(cryptoResponse.body);
    
    final last= Crypto.fromJson(cryptoJsonResponse);
    
    return last;
  }
}
