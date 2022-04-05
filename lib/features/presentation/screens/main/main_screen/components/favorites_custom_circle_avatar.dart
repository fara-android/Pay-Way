import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class FavoritesCustomCircleAvatar extends StatelessWidget {
  final String name;
  final String surname;
  final String fullname;
  const FavoritesCustomCircleAvatar(
      {Key? key,
      required this.name,
      required this.surname,
      required this.fullname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ScaleAnimationContainer(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Styles.iconColor,
                child: Text(
                  fullname,
                  style: TextStyle(color: Styles.textColor, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(color: Styles.textColor, fontSize: 12)),
          Text(surname, style: TextStyle(color: Styles.textColor, fontSize: 12))
        ],
      ),
    );
  }
}
