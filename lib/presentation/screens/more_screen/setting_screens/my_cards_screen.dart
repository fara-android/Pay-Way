import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/appBar.dart' as appBar;
import 'package:wallet_ui/contact_class/card_class.dart';
import 'package:wallet_ui/contact_class/cards_list.dart' as card_list;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/send_sheet/saved_card_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/more_screen/more_screen_widgets/saved_card_container_for_settings.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkBg,
      appBar: appBar.othersPageAppBar('Мои карты'),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                child: Column(
                  children: [

                    SizedBox(height: 24,),

                    ...card_list.cardsList.map((e) => SettingSavedCard(cardSaved: e)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Button(
                  text: 'Добавить карту',
                  isEnable: true,
                  onPressed: (){
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
