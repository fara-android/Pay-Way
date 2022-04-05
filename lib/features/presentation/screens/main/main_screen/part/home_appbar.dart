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
        _MyProfileBottomSheet(),
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

class _MyProfileBottomSheet extends StatelessWidget {
  _MyProfileBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return InkWell(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Container(
                height: Styles.getHeight(context) / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Styles.backgroundColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
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
                          style:
                              TextStyle(color: Styles.textColor, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      "Калмырза Тынымсеитов",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Styles.textColor),
                    ),
                    SizedBox(height: 30),
                    CustomProfileinfoField(
                      title: 'Почта',
                      enabled: true,
                    ),
                    SizedBox(height: 12),
                    CustomProfileinfoField(title: 'Телефон'),
                    SizedBox(height: 12),
                    CustomProfileinfoField(title: 'Ваше Имя'),
                    SizedBox(height: 12),
                    CustomProfileinfoField(title: 'Ваша фамилия'),
                    SizedBox(height: 12),
                    CustomProfileinfoField(title: 'ID клиента'),
                    SizedBox(height: 42),
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
                    SizedBox(height: 30),
                    CustomButton(
                      text: "Сохранить",
                      onPressed: () {},
                      backgroundColor: Styles.backgroundColor2,
                    ),
                    if (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0)
                      SizedBox(height: Styles.getHeight(context) / 2)
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: Text(
        "Ваш профиль",
        style: Styles.ts14(Styles.textColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
