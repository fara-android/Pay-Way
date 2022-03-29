import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/cash_machine_loc_container.dart';

class ReplByCash extends StatelessWidget {
  const ReplByCash({Key? key}) : super(key: key);

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
              'Наличными',
              style: tc.bottomSheetLabelStyle,
            ),
            SizedBox(height: 16,),

            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: (){},
                  child: Text(
                    'Показать на карте',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffBDBDBD),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none
                    ),
                  )
              ),
            ),


            CashMasLocContainer(
                title: 'ул. Игембердиева, 1а/1',
                city: 'Бишкек',
                shift: 'Круглосуточно'
            ),

            CashMasLocContainer(
                title: 'ул. Игембердиева, 1а',
                city: 'Бишкек',
                shift: 'Открыто до 18:00'
            ),
            CashMasLocContainer(
                title: 'ул. Панфилова, 62',
                city: 'Бишкек',
                shift: 'Круглосуточно'
            ),

            CashMasLocContainer(
                title: 'ул. Раззакова, 4а',
                city: 'Бишкек',
                shift: 'Открыто до 18:00'
            ),

            CashMasLocContainer(
                title: 'ул. Льва Толстого, 64',
                city: 'Бишкек',
                shift: 'Закрыто до завтра 09:00'
            ),

            CashMasLocContainer(
                title: 'ул. Максима Горького, 144',
                city: 'Бишкек',
                shift: 'Закрыто до завтра 09:00'
            ),

          ],
        ),
      ),
    );
  }
}
