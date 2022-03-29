import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class CashMasLocContainer extends StatelessWidget {
  const CashMasLocContainer({Key? key, required this.title, required this.city, required this.shift}) : super(key: key);

  final String title;
  final String city;
  final String shift;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 6, ),

      child: Column(
        children: [
          Row(
            children: [

              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: cc.brandColor,
                    shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.local_atm_outlined,
                    color: cc.white,
                  ),
                ),
              ),

              SizedBox(width: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: tc.choiceConTextStyle,
                  ),

                  SizedBox(height: 6,),

                  Text(
                    city,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none
                    ),
                  ),

                  SizedBox(height: 6,),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Color(0xff27AE60),
                      ),

                      SizedBox(width: 8,),

                      Text(
                        shift,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xffBDBDBD),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none
                        ),
                      ),
                    ],
                  )
                ],
              )

            ],
          ),
          SizedBox(height: 12,),
          const Divider(thickness: 1, color: cc.dividerColor, indent: 55,),
        ],
      ),
    );
  }
}
