import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';


class EnterAmountSheet extends StatefulWidget {
  const EnterAmountSheet({Key? key, required this.cardNumber}) : super(key: key);
  final String cardNumber;

  @override
  _EnterAmountSheetState createState() => _EnterAmountSheetState();
}

class _EnterAmountSheetState extends State<EnterAmountSheet> {

  TextEditingController _amountController = TextEditingController();

  double commission = 0;

  void _countCommission(String data){
    setState(() {
      commission = (double.parse(data) / 100) *3;
    });
  }

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector (
                onTap: (){
                  Navigator.of(context).pop();
                },

                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.close, color: cc.brandColor,),
                ),
              ),

              Text(
                  'С карты на кошелёк',
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

                    Text(
                      widget.cardNumber,
                      style: tc.inputTextStyle,
                    ),

                    SizedBox(height: 16),

                    Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                    SizedBox(height: 16),

                    Text(
                      'Сумма'.toUpperCase(),
                      style: tc.bottomSheetHintStyle,
                    ),

                    SizedBox(height: 10),

                    TextField(
                      cursorHeight: 20,
                      style: tc.inputTextStyle,
                      cursorColor: cc.white,
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      onChanged: (value){
                        _countCommission(value);
                      },

                      decoration: const InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),

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
                                  'Комиссия '.toUpperCase(),
                                  style: tc.bottomSheetHintStyle,
                                ),

                                SizedBox(height: 16),

                                Text(
                                  '3%',
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
                                  'Сумма комисии'.toUpperCase(),
                                  style: tc.bottomSheetHintStyle,
                                ),

                                SizedBox(height: 16),

                                Text(
                                  //'${double.parse(_amountController.text) / 100 * 3}',
                                  commission.toStringAsFixed(2),
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

                  ],
                ),
              ),


              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Button(
                      text: 'Перевести',
                      isEnable: true,
                      onPressed: (){
                        Navigator.of(context).pop();
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
