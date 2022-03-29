import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/payment_chek_class.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/history_screen/history_screen_bottom_sheets/history_screen_check_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;


class HistoryContainer extends StatelessWidget {
  const HistoryContainer({Key? key, required this.check,}) : super(key: key);
  final PaymentChek check;

  @override
  Widget build(BuildContext context) {
    Icon _icon = check.isIncome
        ? const Icon(
            Icons.arrow_downward,
            color: cc.white,
          )
        : const Icon(
            Icons.arrow_upward,
            color: cc.white,
          );

    return GestureDetector(
      onTap: check.canTap ? (){
        mbsh.showMyBottomSheet(context, HistoryCheckBottomSheet(check: check));
      } : (){},

      child: Container(
        margin: const EdgeInsets.only(top: 15, ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: cc.homeContainerColor,
                  child: _icon,
                  radius: 22,
                ),

                const SizedBox(
                  width: 15,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      check.name,
                      style: const TextStyle(
                          color: cc.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    tc.historyContainerText(check.summ, context,
                        check.isIncome ? Color(0xff27AE60) : Color(0xffE52A2A), check.isIncome),
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
      ),
    );
  }
}
