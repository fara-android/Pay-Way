import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
class MyBanner extends StatelessWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 311,
      height: 72,
      margin: const EdgeInsets.only(left: 4, right: 4),

      decoration: BoxDecoration(
        color: cc.homeContainerColor,
        borderRadius: BorderRadius.circular(13)
      ),

    );
  }
}
