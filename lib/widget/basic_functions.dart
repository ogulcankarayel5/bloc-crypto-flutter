import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'icon_content.dart';

class BasicFunctions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: buildContainer(height, width),
    );
  }

  Container buildContainer(double height, double width) {
    return Container(
      height: height / 5,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF31316D),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconContent(icon: AntDesign.rocket1, label: "Send Money"),
          IconContent(label: "Request Money", icon: Entypo.wallet),
        ],
      ),
    );
  }
}
