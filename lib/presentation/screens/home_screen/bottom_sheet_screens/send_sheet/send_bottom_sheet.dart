import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/choise_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/replenish_by_card.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/replenish_by_cash.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/send_sheet/saved_card_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/send_sheet/send_to_card.dart';

class SendBottomSheet extends StatelessWidget {
  const SendBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.all(15),
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
              'Перевести',
              style: tc.bottomSheetLabelStyle,
            ),

            SizedBox(height: 36,),

            ChoiceContainer(
              title: 'На карту',
              icon: Icons.credit_card,
              onPressed: (){
                Navigator.of(context).pop();
                mbsh.showMyBottomSheet(context, const SendToCardSheet());
              },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 60,
            ),

            ChoiceContainer(
              title: 'На другой кошелёк',
              icon: Icons.person_outline_outlined,
              onPressed: (){
                Navigator.of(context).pop();
                mbsh.showMyBottomSheet(context, const ReplByCash());
              },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 60,
            ),

            SizedBox(height: 32,),

            Text(
              'Сохраненные карты',
              style: tc.homeScreenCatText,
            ),

            SizedBox(height: 16,),

            SavedCardContainer(
                icon: Icons.credit_card,
                label: 'Оптима основная',
                cardNumber: '4169 •••• •••• 0089'
            ),

            SavedCardContainer(
                icon: Icons.credit_card,
                label: 'Демир',
                cardNumber: '4165 •••• •••• 0001'
            ),

            SavedCardContainer(
                icon: Icons.credit_card,
                label: 'KICB кредитка',
                cardNumber: '4165 •••• •••• 0001'
            ),
          ],
        ),
      ),
    );
  }
}
