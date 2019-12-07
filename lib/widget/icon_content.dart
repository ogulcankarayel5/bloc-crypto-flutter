
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;

  IconContent({this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    final heigth=MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: heigth / 8,
        ),
        SizedBox(height: 10,),
        Text(
          label,
          style: TextStyle(color:Color(0xFFE0E3ED)),
        ),
      ],
    );
  }
}
