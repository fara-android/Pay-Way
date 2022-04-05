part of '../main_screen.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Мои финансы",
                style: TextStyle(
                    color: Styles.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Все",
                style: TextStyle(
                    color: Styles.backgroundColor2,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(width: 8),
                  CustomFinanceContainer(
                    color: Color(0xffBC0A29),
                    descriptionTextColor: Styles.textColor,
                    image: 'assets/images/home_screen_finances/baylik.png',
                    text: 'Байлык Финанс',
                    textColor: Styles.textColor,
                  ),
                  if (index == 2) SizedBox(width: 8)
                ],
              );
            },
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
