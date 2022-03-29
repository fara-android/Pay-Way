import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/sign_in_screen/scrollable_sign_in_screen_container.dart';
import 'package:wallet_ui/presentation/screens/sign_in_screen/sign_in_screen_container.dart';
import 'package:wallet_ui/presentation/screens/sign_in_screen/sign_in_screens/create_pin_screen.dart';

class ConfirmPhoneScreen extends StatefulWidget {
  const ConfirmPhoneScreen({Key? key}) : super(key: key);

  @override
  _ConfirmPhoneScreenState createState() => _ConfirmPhoneScreenState();
}

class _ConfirmPhoneScreenState extends State<ConfirmPhoneScreen> {

  TextEditingController _smsCodeController = TextEditingController();
  bool _contactIsEmpty = false;

  void _chekButton(bool variable){
    if(_smsCodeController.text.isNotEmpty){
      setState(() {
        variable = true;
      });
    } else {
      setState(() {
        variable = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    _contactIsEmpty = _smsCodeController.text.isNotEmpty;


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Введите код из СМС'.toUpperCase(),
                  style: tc.bottomSheetHintStyle,
                ),
                SizedBox(height: 8,),

                TextField(
                  cursorHeight: 20,
                  style: tc.inputTextStyle,
                  cursorColor: cc.white,
                  keyboardType: TextInputType.number,
                  controller: _smsCodeController,
                  inputFormatters: [
                    formatters.pinFormatter
                  ],
                  onEditingComplete: (){
                    _chekButton(_contactIsEmpty);
                    FocusManager.instance.primaryFocus?.unfocus();
                  },

                  decoration: const InputDecoration(
                    hintText: '****',
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
            text: 'Далее',
            isEnable: _contactIsEmpty ? true : false,
            onPressed: (){
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (BuildContext context){
                    return const ScrollableSignInContainer(
                        containerToPut: CreatePinScreen(),
                        label: 'Пароль'
                    );
                  }
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
