import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/replenish_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/replenish_by_card.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/request_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/send_sheet/send_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/banner.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/favorites_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/finance_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/transaction_button.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/appBar.dart' as appB;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cc.darkBg,

      appBar: appB.homeAppBar(context),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Container(

                padding: EdgeInsets.fromLTRB(_w / 30, _w / 30, _w / 30, _w / 14),
                color: cc.brandColor,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: _w / 6),
                      child: Center(
                        child: tc.balanceText('694', '44', context),
                      )
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: _w / 16),
                      margin: EdgeInsets.only(top: _w / 8.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TransactionButton(
                            icon: CupertinoIcons.add,
                            label: 'Пополнить',
                            onPressed: (){
                              mbsh.showMyBottomSheet(context, const ReplBottomSheet());
                            },
                          ),

                          TransactionButton(
                            icon: CupertinoIcons.arrow_right,
                            label: 'Перевести',
                            onPressed: (){
                              mbsh.showMyBottomSheet(context, const SendBottomSheet());
                            },
                          ),

                          TransactionButton(
                            icon: CupertinoIcons.person,
                            label: 'Запросить',
                            onPressed: (){
                              mbsh.showMyBottomSheet(context, const RequestBottomSheet());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              //Раздел избранные------------------------------------------------
              Container(
                margin: EdgeInsets.only(top: _w / 12, left: _w / 25),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Избранные',
                            style: tc.homeScreenCatText
                        ),

                        TextButton(
                            onPressed: (){},
                            child: Text(
                              'Все',
                              style: tc.homeScrnAllBtnText,
                            )
                        )
                      ],
                    ),

                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const <Widget>[
                            FavoritesContainer(
                                name: 'Екатерина',
                                lastName: 'Иванова'
                            ),
                            FavoritesContainer(
                                name: 'Северелектро'
                            ),
                            FavoritesContainer(
                                name: 'Акнет',
                                lastName: 'мама'
                            ),
                            FavoritesContainer(
                                name: 'Гульназа',
                                lastName: 'Билайн'
                            ),
                            FavoritesContainer(
                                name: 'Света',
                                lastName: 'Евлеева'
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),


              //Раздел баннеров-------------------------------------------------
              Container(
                margin: const EdgeInsets.only(left: 12, top: 32),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyBanner(),
                      MyBanner(),
                      MyBanner(),
                      MyBanner(),
                    ],
                  ),
                ),
              ),


              //Раздел мои финансы----------------------------------------------
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 32, left: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Мои финансы',
                            style: tc.homeScreenCatText
                        ),

                        TextButton(
                            onPressed: (){},
                            child: Text(
                              'Все',
                              style: tc.homeScrnAllBtnText,
                            )
                        )
                      ],
                    ),

                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            FinanceContainer(
                                color: Color(0xffBC0A29),
                                logo: 'assets/images/home_screen_finances/baylik.png',
                                title: 'Байлык Финанс',
                                text: 'Короткое описание карточки в две строки'
                            ),

                             FinanceContainer(
                                color: Color(0xffa55000),
                                logo: 'assets/images/home_screen_finances/sber.png',
                                title: 'Сбер банк',
                                text: 'Короткое описание карточки в две строки'
                            ),

                             FinanceContainer(
                                color: Color(0xffFFD203),
                                logo: 'assets/images/home_screen_finances/baylik.png',
                                title: 'Байлык Финанс',
                                text: 'Короткое описание карточки в две строки'
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
