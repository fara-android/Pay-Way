import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/notification_container.dart';

class NotificationsBottomSheet extends StatelessWidget {
  const NotificationsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),

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
              'Уведомления',
              style: tc.bottomSheetLabelStyle
            ),

            const SizedBox(height: 40,),

            Text(
              '30 ноября',
              style: tc.contactHintTextStyle
            ),

            const SizedBox(height: 16,),

            const NotificationContainer(
                notificationText: 'Списание с кошелька на 1 000 сом. \nPlaystation Store',
                money: '1000',
                isIncom: false
            ),
            const NotificationContainer(
                notificationText: 'Пополнение счета с карты \n****8317 на 1 000 сом',
                money: '1000',
                isIncom: true
            ),
            const NotificationContainer(
                notificationText: 'Play.ru — игры со скидкой -500 сом',
                money: '500',
                isIncom: false
            ),

            SizedBox(height: 24,),

            Text(
              '24 ноября',
              style: tc.contactHintTextStyle
            ),

            const SizedBox(height: 16,),

            const NotificationContainer(
                notificationText: 'Пополнение счета с \nкарты ****8317 на 670 сом',
                money: '670',
                isIncom: true
            ),
            const NotificationContainer(
                notificationText: 'Пополнение счета с карты \n****1147 на 12 000 сом',
                money: '12000',
                isIncom: true
            ),
            const NotificationContainer(
                notificationText: 'Play.ru — игры со скидкой -500 сом',
                money: '500',
                isIncom: false
            ),
          ],
        ),
      ),
    );
  }
}
