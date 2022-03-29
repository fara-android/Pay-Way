import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/payment_chek_class.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';


class SaveCheckScreen extends StatefulWidget {
  const SaveCheckScreen({Key? key, required this.title, required this.check}) : super(key: key);

  final String title;
  final PaymentChek check;

  @override
  _SaveCheckScreenState createState() => _SaveCheckScreenState();
}

class _SaveCheckScreenState extends State<SaveCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkBg,

      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Добавить в избранное',
                  style: tc.choiceConTextStyle,
                ),
              ),

              Divider(thickness: 1, color: Color(0xff033144), height: 40,),
              Container(
                child: Column(
                  children: [
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Text(
                              widget.title,
                              style: tc.bottomSheetLabelStyle,
                            ),

                            SizedBox(height: 48,),

                            Text(
                              'Название'.toUpperCase(),
                              style: tc.bottomSheetHintStyle,
                            ),

                            TextField(
                              cursorHeight: 20,
                              style: tc.inputTextStyle,
                              cursorColor: cc.white,
                              keyboardType: TextInputType.text,

                              decoration: InputDecoration(
                                hintText: 'Введите название для сохранения',
                                hintStyle: tc.contactHintTextStyle,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                            ),


                            Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                            SizedBox(height: 16,),

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
                            SizedBox(height: 16,),
                            Text(
                              widget.check.summ,
                              style: tc.inputTextStyle,
                            ),
                            SizedBox(height: 16,),
                            Divider(thickness: 1, color: Color(0xff033144), height: 3,),


                          ],
                        )
                    ),

                  ],
                ),
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    isEnable: true,
                    text: 'Сохранить в избранном',
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
