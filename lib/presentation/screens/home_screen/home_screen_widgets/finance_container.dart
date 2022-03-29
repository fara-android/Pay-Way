import 'package:flutter/cupertino.dart';

class FinanceContainer extends StatelessWidget {
  const FinanceContainer({Key? key, required this.color, required this.logo, required this.title, required this.text}) : super(key: key);
  final Color color;
  final String logo;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 140,
      margin: EdgeInsets.only( right: 12),
      padding: EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16)
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(logo),
              )
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 15,
              fontWeight: FontWeight.w700
            ),
          ),

          Text(
            text,
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 11,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
