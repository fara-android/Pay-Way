import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class SettingContainer extends StatelessWidget {
  const SettingContainer({Key? key, required this.title, required this.icon, this.route}) : super(key: key);
  final String title;
  final IconData icon;
  final route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return route;
            }
          )
        );
      },
      child: Container(

        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 16),

        child: Column(
          children: [
            Row(
              children: [

                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: cc.brandColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: cc.white,
                    ),
                  ),
                ),

                SizedBox(width: 15,),

                Text(
                  title,
                  style: tc.choiceConTextStyle,
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
