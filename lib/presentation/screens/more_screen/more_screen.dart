import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_ui/presentation/constants/appBar.dart' as appBar;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/more_screen/more_screen_widgets/setting_container.dart';
import 'package:wallet_ui/presentation/screens/more_screen/setting_screens/my_cards_screen.dart';
import 'package:wallet_ui/presentation/screens/more_screen/setting_screens/my_qr_screen.dart';
import 'package:wallet_ui/presentation/screens/more_screen/setting_screens/security_screen.dart';
import 'package:wallet_ui/presentation/screens/sign_in_screen/sign_in_screens/main_sign_in_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  Future deleteUser() async{
    final signInPref = await SharedPreferences.getInstance();
    await signInPref.remove('isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: cc.darkBg,

      appBar: appBar.othersPageAppBar('Настройки'),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [


              Container(

                margin: const EdgeInsets.symmetric(vertical: 32),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: const [

                    CircleAvatar(
                      radius: 32,
                      backgroundColor: cc.brandColor,
                      child: Text("К",
                        style: TextStyle(
                          color: cc.white,
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),),
                    ),

                    SizedBox(height: 20,),

                    Text(
                      'Калмырза Тынымсеитов',
                      style: TextStyle(
                        color: cc.white,
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),

              const SettingContainer(title: 'Мои карты', icon: Icons.credit_card, route: MyCardsScreen(),),
              const SettingContainer(title: 'Мой QR', icon: Icons.qr_code, route: MyQrScreen(),),
              const SettingContainer(title: 'Идентификация пользователя', icon: Icons.person_outline_outlined),
              const SettingContainer(title: 'Публичная оферта', icon: Icons.rule),
              const SettingContainer(title: 'Настройки и безопасность', icon: Icons.security_outlined, route: SecurityScreen(),),
              const SettingContainer(title: 'Помощь', icon: Icons.help_outline_outlined),

              GestureDetector(
                onTap: () async{
                  showBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          )
                      ),
                      backgroundColor: cc.lighterBg,
                      context: context,
                      elevation: 10,
                      builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          color: Colors.transparent,
                          child: Center(
                            child: Column(
                              children: [

                                Center(
                                  child: Text(
                                    'Выйти из профиля?',
                                    style: tc.bottomSheetLabelStyle,
                                  ),
                                ),

                                SizedBox(height: _w / 19,),

                                Button(
                                  text: "Выйти",
                                  isEnable: true,
                                  onPressed: () async{
                                    deleteUser();
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                    Navigator.of(context).pushReplacement(
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) {
                                              return const MainSignInScreen();
                                            }
                                        )
                                    );
                                  },
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 55,
                                    margin: EdgeInsets.only(bottom: _w / 18),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff787880).withOpacity(.25),
                                        borderRadius: BorderRadius.circular(11)
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Отменить',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 16,
                                            decoration: TextDecoration.none
                                        ),
                                      ),
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  });
                },
                child: Container(

                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 16),

                  child: Column(
                    children: [
                      Row(
                        children: [

                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffE52A2A),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.exit_to_app,
                                color: cc.white,
                              ),
                            ),
                          ),

                          SizedBox(width: 15,),

                          Text(
                            'Выйти из профиля',
                            style: tc.choiceConTextStyle,
                          )

                        ],
                      ),
                      const Divider(thickness: 1, color: cc.dividerColor, indent: 55,),
                    ],
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
