import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomProfileinfoField extends StatelessWidget {
  const CustomProfileinfoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Личные данные",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffBDBDBD)),
        ),
        SizedBox(height: 8),
        Text(
          "myrza.seitov@gmail.com",
          style: TextStyle(color: Styles.textColor),
        ),
        SizedBox(height: 6),
        Divider(
          color: Color(0xff033144),
        ), 
        SizedBox(height: 8)
      ],
    );
  }
}
