import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/screens/payments_screen/payment_screen_widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkBg,
      appBar: AppBar(
        title: SearchBar(),
        backgroundColor: cc.darkBg,
        elevation: 0,
      ),
      body: Container()
    );
  }
}
