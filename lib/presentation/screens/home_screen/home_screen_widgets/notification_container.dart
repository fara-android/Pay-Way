import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({Key? key, required this.notificationText, required this.money, required this.isIncom}) : super(key: key);

  final String notificationText;
  final String money;
  final bool isIncom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: cc.homeContainerColor,
                child: Icon(Icons.notifications_outlined, color: Colors.white,),
                radius: 22,
              ),

              const SizedBox(
                width: 15,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationText,
                    maxLines: 2,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                        color: cc.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  tc.historyContainerText(money, context,
                      isIncom ? Color(0xff27AE60) : Color(0xffE52A2A), isIncom),
                ],
              )
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          const Divider(
            height: 5,
            thickness: 1,
            color: Color(0xff033144),
            indent: 60,
          )
        ],
      ),
    );
  }
}
