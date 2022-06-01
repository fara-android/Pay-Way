import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomSettingContainer extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color iconContainerColor;
  const CustomSettingContainer({
    Key? key,
    required this.icon,
    required this.title,
    this.iconContainerColor = Styles.backgroundColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Styles.getWidth(context),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: icon,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              SizedBox(
                width: Styles.getWidth(context) / 1.4,
                child: Text(
                  title,
                  style: Styles.ts18(Styles.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 1,
                width: Styles.getWidth(context) / 1.4,
                color: Color(0xFF033144),
              )
            ],
          )
        ],
      ),
    );
  }
}
