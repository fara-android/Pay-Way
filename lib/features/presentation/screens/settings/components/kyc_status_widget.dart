import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class KycStatusWidget extends StatelessWidget {
  final int? kycStatus;
  const KycStatusWidget({Key? key, required this.kycStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: kycStatus == 1 ? Styles.green : Styles.red,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Text(
        kycStatus == 1 ? 'Идентифицирован' : 'Неидентифицирован',
        style: Styles.ts16(Styles.white),
      ),
    );
  }
}
