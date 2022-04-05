part of '../main_screen.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Избранное",
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
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return FavoritesCustomCircleAvatar(
                name: "Евгения ",
                surname: "Васильева",
                fullname: "EB",
              );
            },
          ),
        ),
      ],
    );
  }
}
