part of '../main_screen.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Countup(
      begin: 0,
      end: 694.34,
      duration: Duration(seconds: 1),
      precision: 2,
      style: TextStyle(
        fontSize: 36,
      ),
    );
    // return Text.rich(
    //   TextSpan(
    //     children: [
    // TextSpan(
    //   text: '694,',
    // style: TextStyle(
    //     fontSize: 48,
    //     fontWeight: FontWeight.w700,
    //     color: Styles.textColor),
    // ),
    // TextSpan(
    //   text: '44 ',
    // style: TextStyle(
    //     fontSize: 48,
    //     fontWeight: FontWeight.w100,
    //     color: Styles.textColor),
    // ),
    // TextSpan(
    //   text: 'С',
    //   style: TextStyle(
    //     fontSize: 48,
    //     fontWeight: FontWeight.w100,
    //     color: Styles.textColor,
    //     decoration: TextDecoration.underline,
    //   ),
    // ),
    //     ],
    //   ),
    // );
  }
}
