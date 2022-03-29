import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({Key? key, this.onPressed, required this.title, required this.icon}) : super(key: key);
  final onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: cc.homeContainerColor,
              child: Icon(icon, color: cc.white,),
            ),

            SizedBox(width: 15),

            Text(
              title,
              style: tc.choiceConTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
