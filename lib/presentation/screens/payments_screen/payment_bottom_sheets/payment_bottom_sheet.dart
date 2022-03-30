import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_ui/contact_class/payment_chek_class.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/payments_screen/payment_bottom_sheets/payment_check_bottom_sheet.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({Key? key, required this.title, required this.formatter}) : super(key: key);

  final String title;
  final TextInputFormatter formatter;


  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {


  TextEditingController _phoneController = TextEditingController();
  TextEditingController _summController = TextEditingController();
  double commission = 0;
  bool isActive = false;

  void _chekButton(bool variable){
    if(_phoneController.text.isNotEmpty && _summController.text.isNotEmpty){
      setState(() {
        variable = true;
      });
    } else {
      setState(() {
        variable = false;
      });
    }
  }

  void _countCommission(String data){
    setState(() {
      commission = (double.parse(data) / 100) *3;
    });
  }

  @override
  Widget build(BuildContext context) {

    isActive = _phoneController.text.isNotEmpty && _summController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(

        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            widget.title,
                            style: tc.bottomSheetLabelStyle,
                          ),

                          SizedBox(height: 48,),

                          Text(
                            'Номер кошелька'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,
                            controller: _phoneController,
                            inputFormatters: [
                              widget.formatter
                            ],
                            onEditingComplete: (){
                              _chekButton(isActive);
                              FocusManager.instance.primaryFocus?.unfocus();
                            },

                            decoration: const InputDecoration(
                              hintText: '+996  (___) ___ ___',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),

                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                          SizedBox(height: 18,),

                          Text(
                            'Сумма'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,
                            controller: _summController,
                            onChanged: (data){
                              _countCommission(data);
                              _chekButton(isActive);
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

                          SizedBox(height: 18,),

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

                          SizedBox(height: 18,),

                          Text(
                            'Комментарий'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              hintText: 'Введите комментарий к запросу',
                              hintStyle: tc.contactHintTextStyle,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),


                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                        ],
                      )
                  ),

                  SizedBox(height: 32,),

                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: isActive ? Button(
                  text: 'Отправить запрос',
                  isEnable: true,
                  onPressed: (){
                    Navigator.of(context).pop();
                    mbsh.showMyBottomSheet(
                        context,
                        PaymentCheckBottomSheet(
                            title: widget.title,
                            check: PaymentChek(
                              id: '648894',
                              phone: '+996 (700) 031 016',
                              summ: '1000',
                              data: '22.02.22',
                              time: '16:00',
                              status: 'В обработке',
                              commission: commission.toString()
                            )
                        )
                    );
                  }
                ) : Button(
                    text: 'Отправить запрос',
                    isEnable: false,
                    onPressed: (){}
                )
              ),
            )


          ],
        ),
      ),
    );
  }
}
