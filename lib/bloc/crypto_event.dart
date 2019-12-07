import 'package:bloc_crypto/models/crypto.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();
}

class FetchCryptoEvent extends CryptoEvent{
  @override
  
  List<Object> get props => null;

}
