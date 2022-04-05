part of '../main_screen.dart';

class FastBalanceactions extends StatelessWidget {
  const FastBalanceactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomFastActionContainer(
          text: "Пополнить",
          icon: Icon(Icons.add, color: Styles.backgroundColor2),
          onTap: () {},
        ),
        CustomFastActionContainer(
          text: "Перевести",
          icon: Icon(Icons.arrow_forward_ios, color: Styles.backgroundColor2),
          onTap: () {},
        ),
        CustomFastActionContainer(
          text: "Перевести",
          icon: Icon(Icons.person_outline, color: Styles.backgroundColor2),
          onTap: () {},
        )
      ],
    );
  }
}
