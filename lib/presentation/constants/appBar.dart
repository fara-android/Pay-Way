import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/notiifications_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/profile_info_bottom_sheet.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/notification_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/search_screen.dart';


//Home Screen AppBar------------------------------------------------------------
AppBar homeAppBar(BuildContext context) {

  double _w = MediaQuery.of(context).size.width;

  return AppBar(

    backgroundColor: cc.brandColor,

    title: GestureDetector(
      onTap: (){
        mbsh.showMyBottomSheet(
            context, const ProfileInfoBottomSheet()
        );
      },
      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: cc.white,
            child: const Text('К',
                style:
                TextStyle(
                    color: cc.brandColor,
                    fontWeight: FontWeight.w700
                )
            ),
            radius: _w / 19,
          ),

          SizedBox(
            width: _w / 35,
          ),

          Text(
            'Ваш профиль',
            style: TextStyle(
                color: cc.white,
                fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    ),

    actions: [
      IconButton(onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => const SearchScreen()
            )
        );
      },
          icon: const Icon(CupertinoIcons.search)
      ),

      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.qrcode_viewfinder)),

      IconButton(onPressed: () {
        mbsh.showMyBottomSheet(
            context, const NotificationsBottomSheet()
        );

      }, icon: const Icon(CupertinoIcons.bell)),
    ],
    elevation: 0,
  );
}

//Other Screens AppBar----------------------------------------------------------
AppBar othersPageAppBar(String title) => AppBar(
  backgroundColor: cc.darkBg,
  title: Text(title),
  centerTitle: true,
  titleTextStyle: tc.choiceConTextStyle,
  elevation: 0,
  shape: const Border(
      bottom: BorderSide(
          color: cc.dividerColor,
          width: 1
      )
  ),

);
