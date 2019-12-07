import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

const titleTextStyle= TextStyle(color: Colors.white,fontSize: 40.0,);
const bodyTextStyle=TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0);

final List<PageViewModel> pagesList = [
  PageViewModel(
    title: "No interchange",
    body:
        "Bitcon para birimlerinin anlık değişimlerini hemen öğrenmeye başla...",
    image: const Center(
      child: Icon(
        Icons.account_balance_wallet,
        size: 150.0,
      ),
    ),
    decoration: const PageDecoration(
      titleTextStyle:titleTextStyle,
      bodyTextStyle:bodyTextStyle ,
    ),
  ),
  PageViewModel(
    title: "No Waits",
    body:
        "Bitcon para birimlerinin anlık değişimlerini hemen öğrenmeye başla...",
    image: const Center(
      child: Icon(
        Icons.contacts,
        size: 150.0,
      ),
    ),
    decoration: const PageDecoration(
      titleTextStyle: titleTextStyle,
      bodyTextStyle: bodyTextStyle,
    ),
  ),
];
