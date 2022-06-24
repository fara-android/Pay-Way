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
        IconButton(
            icon: Icon(Icons.web),
            onPressed: () {
              final prefs = sl<SharedPreferences>();
              prefs.clear();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPhoneScreen(),
                  ),
                  (route) => false);
            },
            color: Styles.textColor),
        SizedBox(width: 22),
        InkWell(
            onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return _NotificationsBottomSheet();
                }),
            child: Icon(Icons.notifications_none_outlined,
                color: Styles.textColor))
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
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 64),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
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
          CustomProfileinfoField(
            title: 'Почта',
            enabled: true,
          ),
          SizedBox(height: 16),
          CustomProfileinfoField(
            title: 'Телефон',
            defaultValue: '+996 (501) 331 113',
          ),
          SizedBox(height: 16),
          CustomProfileinfoField(
            title: 'Ваше имя',
            defaultValue: 'Иван',
          ),
          SizedBox(height: 16),
          CustomProfileinfoField(
            title: 'Ваша фамилия',
            defaultValue: 'Иванов',
          ),
          SizedBox(height: 16),
          CustomProfileinfoField(
            title: 'ID клиента',
            defaultValue: '04110',
          ),
          SizedBox(height: 30),
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
          SizedBox(height: 32),
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

class _NotificationsBottomSheet extends StatelessWidget {
  _NotificationsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        color: Styles.backgroundColor,
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 64),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 14),
              Text(
                "Уведомления",
                style: TextStyle(
                    fontSize: 24,
                    color: Styles.textColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 48),
              Text(
                "30 ноября",
                style: TextStyle(color: Color(0xffBDBDBD)),
              ),
              SizedBox(height: 16),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return CustomNotificationsContainer();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
