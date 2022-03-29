import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/appBar.dart' as appBar;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/more_screen/setting_screens/change_pin_bottom_sheet.dart';


class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {

  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkBg,
      
      appBar: appBar.othersPageAppBar('Настройки и безопасность'),
      
      body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 24,),

                            Text(
                              'Настройки безопасности',
                              style: tc.bottomSheetLabelStyle,
                            ),
                            SizedBox(height: 48,),

                            Text(
                              'Ваш email'.toUpperCase(),
                              style: tc.bottomSheetHintStyle,
                            ),
                            SizedBox(height: 16,),
                            Text(
                              'myrza.seitov@gmail.com',
                              style: tc.inputTextStyle,
                            ),
                            SizedBox(height: 16,),
                            Divider(thickness: 1, color: Color(0xff033144), height: 3,),


                            SizedBox(height: 16,),
                            Text(
                              'Номер карты'.toUpperCase(),
                              style: tc.bottomSheetHintStyle,
                            ),
                            SizedBox(height: 16,),

                            GestureDetector(
                              onTap: (){
                                mbsh.showMyBottomSheet(context, const ChangePinBottomSheet());
                              },
                              child: Text(
                                '••••',
                                style: tc.inputTextStyle,
                              ),
                            ),
                            SizedBox(height: 16,),
                            Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                            SizedBox(height: 28,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Использовать FaceID',
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
                      )

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Button(
                    text: 'Сохранить изменения',
                    isEnable: true,
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
