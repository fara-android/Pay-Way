import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomNotificationsContainer extends StatelessWidget {
  const CustomNotificationsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: CircleAvatar(
                child: Icon(Icons.notifications_outlined),
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Списание с кошелька на 1 000 сом. \nPlaystation Store",
                  style: TextStyle(
                      color: Styles.textColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  "- 1 000 C",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12)
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Divider(
            color: Color(0xff033144),
          ),
        )
      ],
    );
  }
}
