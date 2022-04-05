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
        // _MyProfileBottomSheet(),
        InkWell(
          onTap: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return _MyProfileBottomSheet();
            },
          ),
          child: Text(
            "Ваш профиль",
            style: Styles.ts14(Styles.textColor, fontWeight: FontWeight.w700),
          ),
        ),
        Spacer(),
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child: Icon(Icons.search, color: Styles.textColor)),
        SizedBox(width: 22),
        Icon(Icons.web, color: Styles.textColor),
        SizedBox(width: 22),
        Icon(Icons.notifications_none_outlined, color: Styles.textColor)
      ],
    );
  }
}

class _MyProfileBottomSheet extends StatelessWidget {
  _MyProfileBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        color: Styles.backgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.close,
                color: Styles.backgroundColor2,
              ),
            ),
          ),
          SizedBox(height: 4),
          ScaleAnimationContainer(
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Styles.backgroundColor2,
              child: Text(
                "K",
                style: TextStyle(color: Styles.textColor, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 14),
          Text(
            "Калмырза Тынымсеитов",
            style: TextStyle(fontSize: 24, color: Styles.textColor),
          ),
          SizedBox(height: 30),
          CustomProfileinfoField(),
          CustomProfileinfoField(),
          CustomProfileinfoField(),
          CustomProfileinfoField(),
          CustomProfileinfoField(),
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                    "assets/images/payment_screen_images/qr_code.png"),
              ),
              SizedBox(width: 16),
              Text(
                "Мой QR для переводов",
                style: TextStyle(color: Styles.textColor),
              ),
            ],
          ),
          SizedBox(height: 18),
          CustomButton(
            text: "Сохранить",
            onPressed: () {},
            backgroundColor: Styles.backgroundColor2,
          ),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}
