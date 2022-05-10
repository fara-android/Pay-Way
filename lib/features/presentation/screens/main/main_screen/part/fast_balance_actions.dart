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
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return _TopUpBottomSheet();
              },
            );
          },
        ),
        CustomFastActionContainer(
          text: "Перевести",
          icon: Icon(Icons.arrow_forward_ios, color: Styles.backgroundColor2),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return _MoneyTransferBottomSheet();
              },
            );
          },
        ),
        CustomFastActionContainer(
          text: "Запросить",
          icon: Icon(Icons.person_outline, color: Styles.backgroundColor2),
          onTap: () {},
        )
      ],
    );
  }
}

class _TopUpBottomSheet extends StatelessWidget {
  _TopUpBottomSheet({Key? key}) : super(key: key);

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
                "Пополнить",
                style: TextStyle(
                    fontSize: 24,
                    color: Styles.textColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 48),
              CustomFormTopUp(
                text: "Картой",
                icon: Icon(Icons.money),
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return _TopUpFromMapBottomSheet();
                    },
                  );
                },
              ),
              CustomFormTopUp(
                text: "Наличными (список терминалов)",
                icon: Icon(Icons.euro),
                onTap: () {},
              ),
              CustomFormTopUp(
                text: "Запросить",
                icon: Icon(Icons.person_outline),
                onTap: () {},
              ),
              CustomFormTopUp(
                text: "Запросить через QR код",
                icon: Icon(Icons.money),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopUpFromMapBottomSheet extends StatelessWidget {
  _TopUpFromMapBottomSheet({Key? key}) : super(key: key);

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
                "Откуда перевести",
                style: TextStyle(
                    fontSize: 24,
                    color: Styles.textColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 48),
              Text("Номер вашей карты",
                  style: TextStyle(color: Styles.textColor2, fontSize: 12)),
              TextField()
            ],
          ),
        ],
      ),
    );
  }
}

class _MoneyTransferBottomSheet extends StatelessWidget {
  _MoneyTransferBottomSheet({Key? key}) : super(key: key);

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
              SizedBox(height: 4),
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
                "Перевести",
                style: TextStyle(
                    fontSize: 24,
                    color: Styles.textColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 48),
              CustomFormTopUp(
                text: "На другой кошелек",
                icon: Icon(Icons.person),
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return _TopUpFromMapBottomSheet();
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
