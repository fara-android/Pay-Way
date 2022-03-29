import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/enter_amount_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class SendToCardSheet extends StatefulWidget {
  const SendToCardSheet({Key? key}) : super(key: key);

  @override
  _SendToCardSheetState createState() => _SendToCardSheetState();
}

class _SendToCardSheetState extends State<SendToCardSheet> {

  TextEditingController _cardNumberController = TextEditingController();
  bool _switch = true ;

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

                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.close, color: cc.brandColor,),
                ),
              ),

              Text(
                  'Куда перевести',
                  style: tc.bottomSheetLabelStyle
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        'Номер карты'.toUpperCase(),
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
                      text: 'Продожить',
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
