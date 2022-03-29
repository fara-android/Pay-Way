import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/payment_chek_class.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/history_screen/history_screen_bottom_sheets/history_payment_retry.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class HistoryCheckBottomSheet extends StatelessWidget {
  const HistoryCheckBottomSheet({Key? key, required this.check}) : super(key: key);
  final PaymentChek check;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            child: Column(
              children: [
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close, color: cc.brandColor,),
                          ),
                        ),

                        Text(
                          check.name,
                          style: tc.bottomSheetLabelStyle,
                        ),
                        SizedBox(height: 48,),

                        Text(
                          'Номер кошелька'.toUpperCase(),
                          style: tc.bottomSheetHintStyle,
                        ),
                        SizedBox(height: 16,),
                        Text(
                          check.phone,
                          style: tc.inputTextStyle,
                        ),
                        SizedBox(height: 16,),
                        Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                        SizedBox(height: 16,),

                        Text(
                          'Сумма '.toUpperCase(),
                          style: tc.bottomSheetHintStyle,
                        ),
                        SizedBox(height: 16),
                        Text(
                          check.summ,
                          style: tc.inputTextStyle,
                        ),
                        SizedBox(height: 16),
                        Divider(thickness: 1, color: Color(0xff033144), height: 3, endIndent: 30,),
                        SizedBox(height: 16,),

                        Text(
                          'Дата'.toUpperCase(),
                          style: tc.bottomSheetHintStyle,
                        ),
                        SizedBox(height: 16,),
                        Text(
                          check.data,
                          style: tc.inputTextStyle,
                        ),
                        SizedBox(height: 16,),
                        Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                        SizedBox(height: 16,),


                        Text(
                          'Время'.toUpperCase(),
                          style: tc.bottomSheetHintStyle,
                        ),
                        SizedBox(height: 16,),
                        Text(
                          check.time,
                          style: tc.inputTextStyle,
                        ),
                        SizedBox(height: 16,),
                        Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                        SizedBox(height: 16,),


                        Text(
                          'Статус'.toUpperCase(),
                          style: tc.bottomSheetHintStyle,
                        ),
                        SizedBox(height: 16,),
                        Text(
                          check.status,
                          style: tc.inputTextStyle,
                        ),
                        SizedBox(height: 18,),
                        Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                        SizedBox(height: 18,),


                      ],
                    )
                ),

              ],
            ),
          ),

          Button(
            text: 'Отправить повторно',
            isEnable: true,
            onPressed: (){
              Navigator.of(context).pop();
              mbsh.showMyBottomSheet(context, HistoryPaymentRetry(check: check));
            },
          ),


        ],
      ),
    );
  }
}
