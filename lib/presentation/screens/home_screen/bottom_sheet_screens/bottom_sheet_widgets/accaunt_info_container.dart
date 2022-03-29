import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class AccountInfoContainer extends StatelessWidget {
  const AccountInfoContainer({Key? key, required this.hint, required this.value}) : super(key: key);
  final String hint;
  final String value;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              hint.toUpperCase(),
              style: tc.bottomSheetHintStyle
          ),

          const SizedBox(height: 16,),

          Text(
              value,
              style: tc.inputTextStyle
          ),

          const SizedBox(height: 16,),

          const Divider(thickness: 1, color: Color(0xff033144), height: 3,)
        ],
      ),
    );
  }
}
