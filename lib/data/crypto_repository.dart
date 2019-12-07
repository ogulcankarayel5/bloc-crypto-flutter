import 'package:bloc_crypto/data/crypto_api_client.dart';
import 'package:bloc_crypto/models/crypto.dart';

import '../locator.dart';

class CryptoRepository{

  final _cryptoApiClient = locator<CryptoApiClient>();

  Future<Crypto> getWeather() async{

    final weather= await _cryptoApiClient.getCrypto();
    return weather;
    
  }
}