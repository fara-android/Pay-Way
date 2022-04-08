import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class CustomFormTopUp extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function() onTap;
  const CustomFormTopUp(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleAnimationContainer(
          onPressed: onTap,
          child: Row(
            children: [
              CircleAvatar(child: icon),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Styles.textColor, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Divider(
            color: Color(0xff033144),
          ),
        ),
        SizedBox(height: 12)
      ],
    );
  }
}
