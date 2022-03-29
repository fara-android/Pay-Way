import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/card_class.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/screens/more_screen/more_screen_widgets/edit_card_screen.dart';

class SettingSavedCard extends StatelessWidget {
  const SettingSavedCard({Key? key, required this.cardSaved}) : super(key: key);
  final CardClass cardSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (BuildContext context) {
                return EditCardScreen(card: cardSaved);
              }
            )
        );
      },
      child: Container(

        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),

        child: Column(
          children: [
            Row(
              children: [

                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: cc.homeContainerColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Icon(
                      cardSaved.icon,
                      color: cc.white,
                    ),
                  ),
                ),

                SizedBox(width: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardSaved.name,
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none
                      ),
                    ),

                    SizedBox(height: 8,),

                    Text(
                      cardSaved.number,
                      style: tc.inputTextStyle,
                    ),

                    SizedBox(height: 8,),
                  ],
                ),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios, color: cc.white,),
                  ),
                )

              ],
            ),
            const Divider(thickness: 1, color: cc.dividerColor, indent: 55,),
          ],
        ),
      ),
    );
  }
}
