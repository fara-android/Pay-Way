import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/qr_request_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class QRCodeBottomSheet extends StatelessWidget {
  const QRCodeBottomSheet({Key? key, required this.enteredSum}) : super(key: key);

  final String enteredSum;

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return  Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close, color: cc.brandColor),
            ),
          ),

          Text(
            'Укажите сумму',
            style: tc.bottomSheetLabelStyle,
          ),

          SizedBox(height: 48,),

          Container(
            height: _w,
            width: _w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: cc.white,
              image: const DecorationImage(
                image: AssetImage('assets/images/payment_screen_images/img_7.png'),
                fit: BoxFit.contain
              )
            ),
          ),

          SizedBox(height: 16,),

          Button(
              text: 'Изменить сумму ($enteredSum)',
              isEnable: true,
              onPressed: (){
                Navigator.of(context).pop();
                mbsh.showMyBottomSheet(context, const QrRequestBottomSheet());
              },
          )
        ],
      ),
    );
  }
}
