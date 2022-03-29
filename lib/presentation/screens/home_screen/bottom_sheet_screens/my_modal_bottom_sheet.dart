import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

void showMyBottomSheet(BuildContext context, view){
  showCupertinoModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      expand: true,
      backgroundColor: cc.lighterBg,
      context: context, builder: (BuildContext context){
    return view;
  });
}