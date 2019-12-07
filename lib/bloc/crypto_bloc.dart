import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_crypto/data/crypto_repository.dart';
import 'package:bloc_crypto/models/crypto.dart';
import '../locator.dart';
import './bloc.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository = locator<CryptoRepository>();

  @override
  CryptoState get initialState => InitialCryptoState();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is FetchCryptoEvent) {
      yield CryptoLoadingState();
      try {
        final Crypto crypto = await _cryptoRepository.getWeather();
        yield CryptoLoadedState(crypto: crypto);
      } catch (e) {
        yield CryptoErrorState(error: e.toString());
      }
    }
  }
}
