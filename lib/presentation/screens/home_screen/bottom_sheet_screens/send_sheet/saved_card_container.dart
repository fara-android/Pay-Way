import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class SavedCardContainer extends StatelessWidget {
  const SavedCardContainer({Key? key, required this.icon, required this.label, required this.cardNumber}) : super(key: key);
  final IconData icon;
  final String label;
  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 8),

      child: Column(
        children: [
          Row(
            children: [

              Container(
                width: 40,
                height: 40,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: cc.homeContainerColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: cc.white,
                  ),
                ),
              ),

              SizedBox(width: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none
                    ),
                  ),

                  SizedBox(height: 8,),

                  Text(
                    cardNumber,
                    style: tc.inputTextStyle,
                  ),

                  SizedBox(height: 8,),
                ],
              )

            ],
          ),
          const Divider(thickness: 1, color: cc.dividerColor, indent: 55,),
        ],
      ),
    );
  }
}
