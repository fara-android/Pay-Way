import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/choise_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/replenish_by_card.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/replenish_balance/replenish_by_cash.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/qr_request_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/request_bottom_sheet.dart';

class ReplBottomSheet extends StatelessWidget {
  const ReplBottomSheet({Key? key}) : super(key: key);

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
              'Пополнить',
              style: tc.bottomSheetLabelStyle,
            ),

            SizedBox(height: 36,),

            ChoiceContainer(
                title: 'Картой',
                icon: Icons.credit_card,
                onPressed: (){
                  Navigator.of(context).pop();
                  mbsh.showMyBottomSheet(context, const ReplByCardSheet());
                },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),

             ChoiceContainer(
                title: 'Наличными (список терминалов)',
                icon: Icons.local_atm,
                onPressed: (){
                  Navigator.of(context).pop();
                  mbsh.showMyBottomSheet(context, const ReplByCash());
              },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),
            ChoiceContainer(
                title: 'Запросить',
                icon: Icons.person_outline_outlined,
                onPressed: (){
                  Navigator.of(context).pop();
                  mbsh.showMyBottomSheet(context, const RequestBottomSheet());
                },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),


            ChoiceContainer(
                title: 'Запросить через QR код',
                icon: Icons.qr_code,
                onPressed: (){
                  mbsh.showMyBottomSheet(context, const QrRequestBottomSheet());
                },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),

          ],
        ),
      ),
    );
  }
}
