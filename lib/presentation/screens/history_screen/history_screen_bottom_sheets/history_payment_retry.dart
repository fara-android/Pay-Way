import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/payment_chek_class.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class HistoryPaymentRetry extends StatefulWidget {
  const HistoryPaymentRetry({Key? key, required this.check}) : super(key: key);
  final PaymentChek check;

  @override
  _HistoryPaymentRetryState createState() => _HistoryPaymentRetryState();
}

class _HistoryPaymentRetryState extends State<HistoryPaymentRetry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(16),
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
                widget.check.name,
                style: tc.bottomSheetLabelStyle,
              ),
              SizedBox(height: 48,),

              Text(
                'Номер кошелька'.toUpperCase(),
                style: tc.bottomSheetHintStyle,
              ),
              SizedBox(height: 16,),
              Text(
                widget.check.phone,
                style: tc.inputTextStyle,
              ),
              SizedBox(height: 12,),
              Divider(thickness: 1, color: Color(0xff033144), height: 3,),
              SizedBox(height: 16,),

              Text(
                'Сумма'.toUpperCase(),
                style: tc.bottomSheetHintStyle,
              ),
              TextField(
                cursorHeight: 20,
                style: tc.inputTextStyle,
                cursorColor: cc.white,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  hintText: 'Введите сумму',
                  hintStyle: tc.contactHintTextStyle,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
              Divider(thickness: 1, color: Color(0xff033144), height: 3,),
              SizedBox(height: 16,),


              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    text: 'Отправить перевод',
                    isEnable: true,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
