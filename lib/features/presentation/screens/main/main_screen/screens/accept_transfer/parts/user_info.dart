part of '../accept_transfer.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ильяс Исаев',
          style: Styles.ts18(
            Styles.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Divider(
          color: Styles.white,
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ваш Баланс :',
              style: Styles.ts18(
                Styles.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '20000 сом',
              style: Styles.ts18(
                Styles.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
