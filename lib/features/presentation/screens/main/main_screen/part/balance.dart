part of '../main_screen.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '694,',
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Styles.textColor),
          ),
          TextSpan(
            text: '44 С',
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w100,
                color: Styles.textColor),
          ),
        ],
      ),
    );
  }
}
