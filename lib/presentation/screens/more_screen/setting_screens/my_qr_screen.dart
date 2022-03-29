import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/appBar.dart' as appBar;

class MyQrScreen extends StatelessWidget {
  const MyQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: cc.darkBg,
      
      appBar: appBar.othersPageAppBar('Мой QR'),

      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(height: 24,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Ваш личный QR',
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
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
