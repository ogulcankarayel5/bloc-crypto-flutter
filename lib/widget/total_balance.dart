import 'package:bloc_crypto/bloc/bloc.dart';
import 'package:bloc_crypto/bloc/crypto_bloc.dart';
import 'package:bloc_crypto/models/crypto.dart';
import 'package:bloc_crypto/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TotalBalance extends StatelessWidget {
  final dynamic icon;
  final dynamic icon2;
  final Color color;
  TotalBalance({this.icon, this.color, this.icon2});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final _bloc = BlocProvider.of<CryptoBloc>(context);
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, CryptoState state) {
          final crypto = (state as CryptoLoadedState).crypto;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildMainRow(height, crypto),
                buildSubRow(crypto),
              ],
            ),
          );
          // return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          //children: <Widget>[

          //TODO:remove padding from listile
          // ListTile(
          //   dense: true,
          //   leading: buildPadding(icon, height),
          //   title: Text(
          //     crypto.data[0].totalSupply.toDouble().toString(),
          //     style: balanceTextStyle,
          //   ),
          //   trailing: buildPadding(icon2, height),
          // ),
        });
  }

  Padding buildSubRow(Crypto crypto) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
      child: Row(
        children: <Widget>[
          Text(
            "Last 24h:",
            style: textStyle,
          ),
          Text(
            " \$ +${crypto.data[0].quote.usd.percentChange24H.toString()}",
            style: textStyle2,
          ),
        ],
      ),
    );
  }

  Row buildMainRow(double height, Crypto crypto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildPadding(icon, height),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            crypto.data[0].totalSupply.toDouble().toString(),
            style: balanceTextStyle,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        buildPadding(icon2, height),
      ],
    );
  }

  Icon buildPadding(dynamic icon, dynamic height) {
    return Icon(icon, color: color, size: height / 25.toDouble());
  }
}
