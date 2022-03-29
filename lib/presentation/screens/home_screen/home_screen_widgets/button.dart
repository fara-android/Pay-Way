import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, this.onPressed, required this.isEnable}) : super(key: key);

  final String text;
  final  onPressed;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? onPressed : (){},
      child: Container(
        height: 55,
        margin: EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            color: isEnable ? Color(0xff0062CC) : Color(0xff787880).withOpacity(.25),
            borderRadius: BorderRadius.circular(11)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}
