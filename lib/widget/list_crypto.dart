import 'package:bloc_crypto/bloc/bloc.dart';
import 'package:bloc_crypto/models/crypto.dart';
import 'package:bloc_crypto/utils/colors.dart';
import 'package:bloc_crypto/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCrypto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<CryptoBloc>(context);
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, CryptoState state) {
        final _crypto = (state as CryptoLoadedState).crypto;
        final _currency = _crypto.data;
        return Expanded(
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: _currency.length,
            itemBuilder: (context, index) {
              final _currencyIndex = _currency[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF1B1F3A),
                      borderRadius: BorderRadius.circular(10)),
                  child: buildListTile(_currencyIndex),
                ),
              );
            },
          ),
        );
      },
    );
  }

  ListTile buildListTile(Datum _currencyIndex) {
    return ListTile(
      leading: buildContainer(_currencyIndex),
      title: buildRow(_currencyIndex),
    );
  }

  Row buildRow(Datum _currencyIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildColumn(_currencyIndex),
        buildRightColumn(_currencyIndex)
      ],
    );
  }

  Column buildRightColumn(Datum _currencyIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildText(
            currency: "\$ ${_currencyIndex.quote.usd.price.ceil()}",
            style: listCryptoSymbolTextStyle),
       Padding(
         padding: EdgeInsets.only(top:8.0),
         child:  buildPerChangeText(_currencyIndex.quote.usd.percentChange1H),
       )
      ],
    );
  }

  buildPerChangeText(currency){
    TextSpan perChangeSymbol;
    TextSpan perChangeText;
    
    if(currency >0){
     
      perChangeSymbol=TextSpan(text:"+ ",style:TextStyle(color: Color(0xFF19585D)) );
      perChangeText=TextSpan(text:"\$$currency",style:TextStyle(color: Color(0xFF19585D)));
    }else{
       perChangeSymbol=TextSpan(text:"- ",style:TextStyle(color: Color(0xFFB72464)) );
      perChangeText=TextSpan(text:"\$$currency",style:TextStyle(color: Color(0xFFB72464)));
    }

    return RichText(
      text:TextSpan(
        children: [perChangeSymbol,perChangeText]
      )
    );
    
  }


  Column buildColumn(Datum _currencyIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildTextRow(_currencyIndex),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: buildText(
              currency:
                  _currencyIndex.quote.usd.volume24H.floorToDouble().toString(),
              style: listCryptoTextStyle),
        )
      ],
    );
  }

  Row buildTextRow(Datum _currencyIndex) {
    return Row(
      children: <Widget>[
        buildText(
            currency: _currencyIndex.symbol, style: listCryptoSymbolTextStyle),
        buildText(currency: _currencyIndex.name, style: listCryptoTextStyle)
      ],
    );
  }

  Container buildContainer(Datum _currencyIndex) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          style: BorderStyle.solid,
          color: Color(0xFF454E93),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: CircleAvatar(
        child: Text(_currencyIndex.name[0],
            style: listCryptoCircleAvatarTextStyle),
      ),
    );
  }

  Text buildText({String currency, TextStyle style}) {
    return Text(
      currency + " ",
      style: style,
    );
  }
}
