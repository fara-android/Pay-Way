import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class ScrollableSignInContainer extends StatefulWidget {
  const ScrollableSignInContainer({Key? key, required this.containerToPut, required this.label}) : super(key: key);
  final Widget containerToPut;
  final String label;

  @override
  _ScrollableSignInContainerState createState() => _ScrollableSignInContainerState();
}

class _ScrollableSignInContainerState extends State<ScrollableSignInContainer> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: cc.darkBg,

      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 80),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/app_logo.png'),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Text(
                      widget.label,
                      style: tc.signInLabelTextStyle,
                    ),
                  ),

                  SizedBox(height: 40,),

                  widget.containerToPut,


                ],

              ),
            ),
          )
      ),
    );
  }
}
