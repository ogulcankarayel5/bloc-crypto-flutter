import 'package:bloc_crypto/models/crypto.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();
}

class InitialCryptoState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadingState extends CryptoState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class CryptoLoadedState extends CryptoState{

  final Crypto crypto;
  CryptoLoadedState({this.crypto});
  @override
  // TODO: implement props
  List<Object> get props => [crypto];

}

class CryptoErrorState extends CryptoState{
  final String error;

  CryptoErrorState({this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];

  
}
