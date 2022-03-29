
import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;

class TransactionButton extends StatelessWidget {
  const TransactionButton({Key? key, required this.icon, this.onPressed, required this.label}) : super(key: key);
  final icon;
  final onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [

          Container(
              height: _w / 7,
              width: _w / 7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Icon(
                    icon,
                    size: _w / 14,
                    color: cc.brandColor
                ),
              )
          ),

          SizedBox(height: _w / 35,),

          Text(
            label,
            style: TextStyle(
              color: cc.white,
              fontSize: 13,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
