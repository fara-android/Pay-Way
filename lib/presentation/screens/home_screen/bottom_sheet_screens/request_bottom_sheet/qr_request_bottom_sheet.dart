import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/qr_code_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class QrRequestBottomSheet extends StatefulWidget {
  const QrRequestBottomSheet({Key? key}) : super(key: key);

  @override
  _QrRequestBottomSheetState createState() => _QrRequestBottomSheetState();
}

class _QrRequestBottomSheetState extends State<QrRequestBottomSheet> {

  TextEditingController _requestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'Укажите сумму',
                        style: tc.bottomSheetLabelStyle,
                      ),

                      SizedBox(height: 48,),

                      Text(
                        'Сколько хотите получить с человека?'.toUpperCase(),
                        style: tc.bottomSheetHintStyle,
                      ),

                      SizedBox(height: 16,),

                      TextField(
                        cursorHeight: 20,
                        style: tc.inputTextStyle,
                        cursorColor: cc.white,
                        keyboardType: TextInputType.number,
                        controller: _requestController,

                        decoration: const InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),


                      Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                    ],
                  ),
                ),

                Button(
                  text: 'Готово',
                  isEnable: true,
                  onPressed: (){
                    Navigator.of(context).pop();
                    mbsh.showMyBottomSheet(context, QRCodeBottomSheet(enteredSum: _requestController.text));
                  },
                )

              ]
          ),
      ),
    );
  }
}
