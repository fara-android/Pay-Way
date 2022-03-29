import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/payment_chek_class.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/payments_screen/payment_bottom_sheets/save_check_bottom_sheet.dart';


class PaymentCheckBottomSheet extends StatelessWidget {
  const PaymentCheckBottomSheet({Key? key, required this.title, required this.check}) : super(key: key);
  final String title;
  final PaymentChek check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(

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
                            title,
                            style: tc.bottomSheetLabelStyle,
                          ),

                          SizedBox(height: 48,),

                          Text(
                            'ID транзакции'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),
                          SizedBox(height: 16,),
                          Text(
                            check.id,
                            style: tc.inputTextStyle,
                          ),
                          SizedBox(height: 12,),
                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                          SizedBox(height: 16,),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Сумма '.toUpperCase(),
                                        style: tc.bottomSheetHintStyle,
                                      ),

                                      SizedBox(height: 16),

                                      Text(
                                        check.summ,
                                        style: tc.inputTextStyle,
                                      ),

                                      SizedBox(height: 10),

                                      Divider(thickness: 1, color: Color(0xff033144), height: 3, endIndent: 30,)
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Комиссия'.toUpperCase(),
                                        style: tc.bottomSheetHintStyle,
                                      ),

                                      SizedBox(height: 16),

                                      Text(
                                        //'${double.parse(_amountController.text) / 100 * 3}',
                                        check.commission.toString(),
                                        style: tc.inputTextStyle,
                                      ),

                                      SizedBox(height: 10),

                                      Divider(thickness: 1, color: Color(0xff033144), height: 3,)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),

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
                            'Статус перевода'.toUpperCase(),
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

            Container(
              child: Column(
                children: [
                  Button(
                    text: 'Понятно',
                    isEnable: true,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),

                  Button(
                    text: 'Добавить в избранное',
                    isEnable: true,
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SaveCheckScreen(
                                      title: title,
                                      check: check
                                  )
                          )
                      );
                    },
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
