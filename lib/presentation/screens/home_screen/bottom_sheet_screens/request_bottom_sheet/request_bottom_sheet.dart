import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/choise_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/create_request_bottom_sheets/create_request_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/qr_request_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/request_history_bottom_sheet.dart';

class RequestBottomSheet extends StatelessWidget {
  const RequestBottomSheet({Key? key}) : super(key: key);

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
              title: 'Запросить через QR код',
              icon: Icons.qr_code,
              onPressed: (){
                Navigator.of(context).pop();
                mbsh.showMyBottomSheet(context, const QrRequestBottomSheet());
              },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),

            ChoiceContainer(
              title: 'Создать новый запрос',
              icon: Icons.person_outline_outlined,
              onPressed: (){
                Navigator.of(context).pop();
                mbsh.showMyBottomSheet(context, const CreateRequestBottomSheet());
              },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),

            ChoiceContainer(
                title: 'История запросов',
                icon: Icons.history,
                onPressed: (){
                  Navigator.of(context).pop();
                  mbsh.showMyBottomSheet(context, const RequestsHistoryBottomSheet());
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
