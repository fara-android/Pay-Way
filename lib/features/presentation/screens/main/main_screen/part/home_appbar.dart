part of "../main_screen.dart";

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            "K",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "Ваш профиль",
          style: Styles.ts14(Styles.textColor, fontWeight: FontWeight.w700),
        ),
        Spacer(),
        Icon(Icons.search, color: Styles.textColor),
        SizedBox(width: 22),
        Icon(Icons.web, color: Styles.textColor),
        SizedBox(width: 22),
        Icon(Icons.notifications_none_outlined, color: Styles.textColor)
      ],
    );
  }
}
