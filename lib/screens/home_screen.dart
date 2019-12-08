import 'dart:async';

import 'package:bloc_crypto/bloc/bloc.dart';
import 'package:bloc_crypto/bloc/crypto_bloc.dart';
import 'package:bloc_crypto/models/crypto.dart';
import 'package:bloc_crypto/utils/colors.dart';
import 'package:bloc_crypto/utils/styles.dart';
import 'package:bloc_crypto/widget/app_bar.dart';
import 'package:bloc_crypto/widget/basic_functions.dart';
import 'package:bloc_crypto/widget/list_crypto.dart';
import 'package:bloc_crypto/widget/total_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  Completer<void> _refreshCompleter = Completer<void>();
  @override
  Widget build(BuildContext context) {
    final _cryptoBloc = BlocProvider.of<CryptoBloc>(context);

    _cryptoBloc.add(FetchCryptoEvent());
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocBuilder(
          bloc: _cryptoBloc,
          builder: (context, CryptoState state) {
            if (state is CryptoLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CryptoLoadedState) {
              final crypto = state.crypto;
              _refreshCompleter.complete();
              _refreshCompleter=Completer();
              return RefreshIndicator(
                onRefresh: (){
                  _cryptoBloc.add(RefreshCryptoEvent());
                  return _refreshCompleter.future;
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, top: 8.0),
                        child: Text(
                          "Hi,your total balance",
                          style: textStyle,
                        ),
                      ),
                      TotalBalance(
                        color: paleWhite,
                        icon: FontAwesome.bitcoin,
                        icon2: Icons.add_alert,
                      ),
                      BasicFunctions(),
                      ListCrypto(),
                    ],
                  ),
                ),
              );
            }
            if (state is CryptoErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return Center(child: Text("Hata"));
            }
          },
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Icon(
        Icons.search,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: TextField(
        textAlign: TextAlign.center,
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          hintText: "WALLET",
          hintStyle: appTextStyle,
          suffixIcon: IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
