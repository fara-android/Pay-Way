part of '../main_screen.dart';

class AdContainer extends StatelessWidget {
  const AdContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              SizedBox(width: 8),
              FavoritesCustomBannerContainer(
                text: "Баннер 311х72px",
              ),
              if (index == 4) SizedBox(width: 8),
            ],
          );
        },
      ),
    );
  }
}
