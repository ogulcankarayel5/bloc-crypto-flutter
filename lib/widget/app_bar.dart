import 'package:bloc_crypto/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
   CustomAppBar({Key key}) : preferredSize = Size.fromHeight(56.0), super(key: key);

    @override
    final Size preferredSize; // default is 56.0
 
  
  
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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