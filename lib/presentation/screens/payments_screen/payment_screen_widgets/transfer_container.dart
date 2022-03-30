import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/payments_screen/payment_bottom_sheets/payment_bottom_sheet.dart';


class TransferContainer extends StatelessWidget {
  const TransferContainer({Key? key, required this.label, required this.image}) : super(key: key);

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        mbsh.showMyBottomSheet(context, PaymentBottomSheet(title: label, formatter: formatters.phoneNumberFormatter));
      },
      child: Container(

        width: 109,
        height: 109,
        margin: EdgeInsets.only(right: 8, top: 8),
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
            color: cc.lighterBg,
            borderRadius: BorderRadius.circular(8)
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              backgroundColor: cc.homeContainerColor,
              radius: 20,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  maxLines: 2,
                  style: TextStyle(
                      color: cc.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
