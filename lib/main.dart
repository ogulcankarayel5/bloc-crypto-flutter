import 'package:bloc_crypto/locator.dart';
import 'package:bloc_crypto/screens/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/crypto_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

const scaffoldColor = Color(0xFF1F1E3C);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoBloc>(
      create: (context) => CryptoBloc(),
      child: MaterialApp(
          routes: {},
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: scaffoldColor,
          ),
          home: OnBoardingScreen()),
    );
  }
}
