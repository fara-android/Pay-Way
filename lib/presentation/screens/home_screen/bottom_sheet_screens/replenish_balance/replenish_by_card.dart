import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/enter_amount_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class ReplByCardSheet extends StatefulWidget {
  const ReplByCardSheet({Key? key}) : super(key: key);

  @override
  _ReplByCardSheetState createState() => _ReplByCardSheetState();
}

class _ReplByCardSheetState extends State<ReplByCardSheet> {

  TextEditingController _cardNumberController = TextEditingController();
  bool _switch = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },

              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.close, color: cc.brandColor,),
              ),
            ),

             Text(
              'Откуда перевести',
              style: tc.bottomSheetLabelStyle
            ),

            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Номер вашей карты'.toUpperCase(),
                    style: tc.bottomSheetHintStyle,
                  ),

                  SizedBox(height: 16,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: TextField(
                          cursorHeight: 20,
                          style: tc.inputTextStyle,
                          cursorColor: cc.white,
                          keyboardType: TextInputType.number,
                          controller: _cardNumberController,
                          inputFormatters: [
                            formatters.cardNumberFormatter
                          ],

                          decoration: const InputDecoration(
                            hintText: '**** **** **** ****',
                            hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Icon(Icons.qr_code, color: cc.white,)
                      )
                    ],
                  ),

                  Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                  SizedBox(height: 28,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'мм/гг'.toUpperCase(),
                                style: tc.bottomSheetHintStyle,
                              ),

                              SizedBox(height: 10),

                              TextField(
                                cursorHeight: 20,
                                style: tc.inputTextStyle,
                                cursorColor: cc.white,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  formatters.cardDateFormatter
                                ],

                                decoration: const InputDecoration(
                                  hintText: '00/00',
                                  hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                              ),

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
                                'cvc'.toUpperCase(),
                                style: tc.bottomSheetHintStyle,
                              ),

                              SizedBox(height: 10),

                              TextField(
                                cursorHeight: 20,
                                style: tc.inputTextStyle,
                                cursorColor: cc.white,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  formatters.cvcFormatter
                                ],

                                decoration: const InputDecoration(
                                  hintText: '000',
                                  hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                ),
                              ),

                              Divider(thickness: 1, color: Color(0xff033144), height: 3,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Привязать карту после платежа',
                          style: tc.inputTextStyle,
                        ),


                        CupertinoSwitch(
                          value: _switch,
                          onChanged: (value){
                            setState(() {
                              _switch = value;
                            });
                          },
                        )
                      ],
                    )
                ],
              ),
            ),


            Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Button(
                    text: 'Продолжить',
                    isEnable: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                      showCupertinoModalBottomSheet(
                          enableDrag: false,
                          isDismissible: false,
                          expand: true,
                          backgroundColor: cc.lighterBg,
                          useRootNavigator: false,
                          context: context, builder: (BuildContext context){
                        return EnterAmountSheet(cardNumber: _cardNumberController.text);
                      });
                      },
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}
