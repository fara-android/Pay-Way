import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/main_screen.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {

  TextEditingController _pinController = TextEditingController();
  TextEditingController _confirmPinController = TextEditingController();
  bool _contactIsEmpty = false;
  bool _switch = true;
  late final SharedPreferences signInPref;


  Future setUser() async{
    final signInPref = await SharedPreferences.getInstance();
    await signInPref.setBool('isLoggedIn', true);
  }

  @override
  void initState() {
    super.initState();
  }

  void _chekButton(bool variable){
    if(_pinController.text.isNotEmpty && _confirmPinController.text.isNotEmpty && _pinController.text == _confirmPinController.text){
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

    _contactIsEmpty = _pinController.text.isNotEmpty && _confirmPinController.text.isNotEmpty && _pinController.text == _confirmPinController.text;

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
                    'Придумайте PIN или используйте FaceID',
                    style: tc.choiceConTextStyle
                ),

                SizedBox(height: 16,),
                Text(
                  'Введите PIN код'.toUpperCase(),
                  style: tc.bottomSheetHintStyle,
                ),
                SizedBox(height: 8,),

                TextField(
                  cursorHeight: 20,
                  style: tc.inputTextStyle,
                  cursorColor: cc.white,
                  keyboardType: TextInputType.number,
                  controller: _pinController,
                  inputFormatters: [
                    formatters.pinFormatter
                  ],
                  onChanged: (string){
                    _chekButton(_contactIsEmpty);
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

                SizedBox(height: 16,),

                Text(
                  'Подтвердите PIN'.toUpperCase(),
                  style: tc.bottomSheetHintStyle,
                ),
                SizedBox(height: 8,),
                TextField(
                  cursorHeight: 20,
                  style: tc.inputTextStyle,
                  cursorColor: cc.white,
                  keyboardType: TextInputType.number,
                  controller: _confirmPinController,
                  inputFormatters: [
                    formatters.pinFormatter
                  ],
                  onChanged: (string){
                    _chekButton(_contactIsEmpty);
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

          SizedBox(height: 48,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                  text: 'Войти',
                  isEnable: _contactIsEmpty ? true : false,
                  onPressed: () async{
                    setUser();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                        builder: (BuildContext context) {
                          return MainScreen();
                        }
                      )
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Platform.isIOS ? 'Использовать FaceID для входа'
                        : 'Использовать отпечаток пальца \nдля входа в приложение',
                      maxLines: 2,
                      style: tc.choiceConTextStyle,
                    ),


                    CupertinoSwitch(
                      value: _switch,
                      onChanged: (value){
                        setState(() {
                          _switch = value;
                        });
                      },
                    ),

                  ],
                ),
                SizedBox(height: 40,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
