import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/accaunt_info_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class ProfileInfoBottomSheet extends StatelessWidget {
  const ProfileInfoBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return  SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),

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

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: _w / 12,
                    backgroundColor: cc.brandColor,
                    child: Text(
                        "К",
                      style: tc.bottomSheetLabelStyle
                    ),
                  ),

                  SizedBox(height: _w / 19,),

                    Text(
                      'Калмырза Тынымсеитов',
                      style: tc.bottomSheetLabelStyle
                    )
                ],
              ),
            ),

            const AccountInfoContainer(
              hint: 'Личные данные',
              value: 'myrza.seitov@gmail.com',
            ),
            const AccountInfoContainer(
              hint: 'Телефон',
              value: '+996 (555) 123 456',
            ),
            const AccountInfoContainer(
              hint: 'Ваше имя',
              value: 'Калмырза',
            ),
            const AccountInfoContainer(
              hint: 'Ваша Фамилия',
              value: 'Тынымсеитов',
            ),
            const AccountInfoContainer(
              hint: 'ID клиента',
              value: '041011',
            ),

            SizedBox(height: 30,),

            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: cc.brandColor,
                  child: Icon(Icons.qr_code, color: Colors.white,),
                ),
                SizedBox(width: _w / 25,),
                Text(
                  'Мой QR для переводов',
                  style: tc.inputTextStyle
                ),
              ],
            ),

            SizedBox(height: _w / 15,),

            Button(
              text: 'Сохранить',
              isEnable: true,
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
