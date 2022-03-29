import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class ChangePinBottomSheet extends StatefulWidget {
  const ChangePinBottomSheet({Key? key}) : super(key: key);

  @override
  _ChangePinScreenState createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinBottomSheet> {
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
                            'Изменить PIN код',
                            style: tc.bottomSheetLabelStyle,
                          ),

                          SizedBox(height: 48,),

                          Text(
                            'Текущий PIN код'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              formatters.pinFormatter
                            ],

                            decoration: const InputDecoration(
                              hintText: '••••',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                          SizedBox(height: 16,),

                          Text(
                            'Новый PIN код'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              formatters.pinFormatter
                            ],

                            decoration: const InputDecoration(
                              hintText: '••••',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                          SizedBox(height: 16,),

                          Text(
                            'Подтвердите новый PIN код'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              formatters.pinFormatter
                            ],

                            decoration: const InputDecoration(
                              hintText: '••••',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                          SizedBox(height: 16,),


                        ],
                      )
                  ),

                  SizedBox(height: 32,),

                ],
              ),
            ),

            Button(
                text: 'Изменить',
                isEnable: true,
                onPressed: (){
                  Navigator.of(context).pop();
                },
            ),
          ],
        ),
      ),
    );
  }
}
