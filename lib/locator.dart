import 'package:get_it/get_it.dart';

import 'data/crypto_api_client.dart';
import 'data/crypto_repository.dart';

GetIt locator=GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => CryptoApiClient());
  locator.registerLazySingleton(() => CryptoRepository());
}