import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 45,

      decoration: BoxDecoration(
        color: Color(0xff022D3F),
        borderRadius: BorderRadius.circular(7)
      ),
      child: const Center(
        child: TextField(
          style: TextStyle(
            color: cc.white,
            fontSize: 18
          ),
          cursorColor: cc.white,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff053950),
            ),
            hintText: 'Поиск среди платежей',
            contentPadding: EdgeInsets.all(13),
            labelStyle: TextStyle(color: Colors.white),
            fillColor: Colors.white,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Color(0xff053950)
            )
          ),
        ),
      ),

    );
  }
}
