import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class CustomFastActionContainer extends StatelessWidget {
  final String text;
  final Icon icon;
  const CustomFastActionContainer({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleAnimationContainer(
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                color: Styles.textColor, borderRadius: BorderRadius.circular(16)),
            child: icon,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(color: Styles.textColor),
        )
      ],
    );
  }
}
