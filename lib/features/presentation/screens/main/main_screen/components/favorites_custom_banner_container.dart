import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class FavoritesCustomBannerContainer extends StatelessWidget {
  final String text;
  const FavoritesCustomBannerContainer({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationContainer(
      child: Container(
        decoration: BoxDecoration(
            color: Styles.IconColor, borderRadius: BorderRadius.circular(14)),
        width: 311,
        height: 72,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
