import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/favorites_container.dart';
import 'package:wallet_ui/presentation/screens/payments_screen/payment_screen_widgets/search_bar.dart';
import 'package:wallet_ui/presentation/screens/payments_screen/payment_screen_widgets/transfer_container.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {


  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: cc.darkBg,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [

              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Платежи',
                  style: TextStyle(
                      color: cc.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchBar(),
              ),

              Container(
                margin: EdgeInsets.only(left: _w / 25),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Избранные',
                            style: tc.homeScreenCatText
                        ),

                        TextButton(
                            onPressed: (){},
                            child: Text(
                              'Все',
                              style: tc.homeScrnAllBtnText,
                            )
                        )
                      ],
                    ),

                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const <Widget>[
                            FavoritesContainer(
                                name: 'Екатерина',
                                lastName: 'Иванова'
                            ),
                            FavoritesContainer(
                                name: 'Северелектро'
                            ),
                            FavoritesContainer(
                                name: 'Акнет',
                                lastName: 'мама'
                            ),
                            FavoritesContainer(
                                name: 'Гульназа',
                                lastName: 'Билайн'
                            ),
                            FavoritesContainer(
                                name: 'Света',
                                lastName: 'Евлеева'
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Container(

                margin: EdgeInsets.only(top: _w / 12, left: _w / 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                        'Переводы',
                        style: tc.homeScreenCatText
                    ),

                    SizedBox(height: 10,),

                    Container(
                      child: GridView.count(
                        crossAxisCount: 3,

                        shrinkWrap: true,
                        children: const [
                          TransferContainer(
                              label: 'Перевод на счет',
                              image: 'assets/images/payment_screen_images/img.png'
                          ),

                          TransferContainer(
                              label: 'Перевод на Megapay',
                              image: 'assets/images/payment_screen_images/img_1.png'
                          ),

                          TransferContainer(
                              label: 'Перевод на O!Деньги',
                              image: 'assets/images/payment_screen_images/img_2.png'
                          ),

                          TransferContainer(
                              label: 'Перевод на Balance',
                              image: 'assets/images/payment_screen_images/img_3.png'
                          ),

                          TransferContainer(
                              label: 'Перевод на Эльсом',
                              image: 'assets/images/payment_screen_images/img_4.png'
                          ),

                          TransferContainer(
                              label: 'Погашение кредитов',
                              image: 'assets/images/payment_screen_images/img_5.png'
                          ),

                          TransferContainer(
                              label: 'На карту',
                              image: 'assets/images/payment_screen_images/img_6.png'
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
