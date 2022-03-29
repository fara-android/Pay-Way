import 'package:flutter/material.dart';


TextStyle homeScreenCatText = const TextStyle(
    color: Color(0xffFFFFFF),
    fontSize: 18,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none
);

TextStyle homeScrnAllBtnText = const TextStyle(
    fontSize: 15,
    color: Color(0xff0062CC),
    fontWeight: FontWeight.w600
);

TextStyle inputTextStyle = const TextStyle(
    fontSize: 18,
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none
);

TextStyle bottomSheetLabelStyle =  const TextStyle(
  color: Color(0xffFFFFFF),
  decoration: TextDecoration.none,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle signInLabelTextStyle =  const TextStyle(
  color: Color(0xffFFFFFF),
  decoration: TextDecoration.none,
  fontSize: 32,
  fontWeight: FontWeight.w700,
);

TextStyle bottomSheetHintStyle = const TextStyle(
    fontSize: 12,
    color: Color(0xffBDBDBD),
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none
);

TextStyle contactNumberTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xffBDBDBD),
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none
);

TextStyle pageLabelTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none
);

TextStyle choiceConTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none
);

TextStyle contactHintTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xffBDBDBD),
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none
);

RichText balanceText(String mainB, String pene, BuildContext context){

  double _w = MediaQuery.of(context).size.width;

  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: mainB + ',',
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontSize: _w / 8,
            fontWeight: FontWeight.bold
          )
        ),

        TextSpan(
            text: pene + " ",
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: _w / 8,
                fontWeight: FontWeight.w200
            )
        ),

        TextSpan(
            text: 'C',
            style: TextStyle(
              decoration: TextDecoration.underline,
                decorationThickness: 0.3,
                decorationColor: const Color(0xffFFFFFF),
                shadows: const [Shadow(offset: Offset(0, -2), color: Colors.white)],
                color: Colors.transparent,
                fontSize: _w / 8,
                fontWeight: FontWeight.w200
            )
        ),
      ]
    ),
  );
}

RichText historyContainerText(String main, BuildContext context, Color color, bool isIncom){

  double _w = MediaQuery.of(context).size.width;

  return RichText(
    text: TextSpan(
        children: [
          TextSpan(
              text: (isIncom ? '+ ' : '- ') + main + ' ',
              style: TextStyle(
                  color: color,
                  fontSize: _w / 22,
                  fontWeight: FontWeight.w200
              )
          ),

          TextSpan(
              text: 'C',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 0.3,

                  color: color,
                  fontSize: _w / 22,
                  fontWeight: FontWeight.w200
              )
          ),
        ]
    ),
  );
}