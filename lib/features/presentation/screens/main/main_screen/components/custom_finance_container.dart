import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class CustomFinanceContainer extends StatelessWidget {
  final Color color;
  final String image;
  final String text;
  final Color descriptionTextColor;
  final Color textColor;
  const CustomFinanceContainer(
      {Key? key,
      required this.color,
      required this.image,
      required this.text,
      required this.descriptionTextColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationContainer(
      child: Container(
        width: 156,
        height: 140,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Image.asset(
                  image,
                  height: 32,
                  width: 32,
                ),
              ),
              SizedBox(height: 24),
              Text(
                text,
                // "Байлык Финанс",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: textColor),
              ),
              SizedBox(height: 8),
              Text(
                "Короткое описание \nкарточки в две строки",
                style: TextStyle(
                    fontSize: 11,
                    color: descriptionTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
