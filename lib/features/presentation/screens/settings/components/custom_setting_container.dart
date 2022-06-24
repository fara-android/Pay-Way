import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomSettingContainer extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color iconContainerColor;
  final Widget? attentionWidget;
  final Function() onTap;
  const CustomSettingContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.attentionWidget,
    this.iconContainerColor = Styles.backgroundColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
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
                Row(
                  children: [
                    SizedBox(
                      width: Styles.getWidth(context) / 1.6,
                      child: Text(
                        title,
                        style: Styles.ts18(Styles.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    attentionWidget ?? SizedBox()
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  height: 1,
                  width: Styles.getWidth(context) / 1.4,
                  color: Color(0xFF033144),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
