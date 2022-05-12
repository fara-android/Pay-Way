part of '../accept_transfer.dart';

class TransferInfo extends StatelessWidget {
  final String reciver;
  final String amount;
  const TransferInfo({
    Key? key,
    required this.reciver,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Styles.backgroundColor2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Получатель',
            style: Styles.ts14(Styles.white),
          ),
          SizedBox(height: 10),
          Text(
            reciver,
            style: Styles.ts16(Styles.grey4),
          ),
          Divider(
            color: Styles.white,
          ),
          SizedBox(height: 16),
          Text(
            'Сумма',
            style: Styles.ts14(Styles.white),
          ),
          SizedBox(height: 10),
          Text(
            '$amount сом',
            style: Styles.ts16(Styles.grey4),
          ),
          Divider(
            color: Styles.white,
          ),
          SizedBox(height: 16),
          Row(children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Комиссия',
                    style: Styles.ts16(
                      Styles.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '0 %',
                    style: Styles.ts16(Styles.grey4),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Сумма комисии',
                    style: Styles.ts16(
                      Styles.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '0 сом',
                    style: Styles.ts16(Styles.grey4),
                  ),
                ],
              ),
            ),
          ]),
          Divider(
            color: Styles.white,
          ),
        ],
      ),
    );
  }
}
