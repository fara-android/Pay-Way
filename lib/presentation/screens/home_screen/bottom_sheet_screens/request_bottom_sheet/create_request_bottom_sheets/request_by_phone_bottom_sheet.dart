import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/favorites_container.dart';


class RequestByPhoneBottomSheet extends StatefulWidget {
  const RequestByPhoneBottomSheet({Key? key}) : super(key: key);

  @override
  _RequestByPhoneBottomSheetState createState() => _RequestByPhoneBottomSheetState();
}

class _RequestByPhoneBottomSheetState extends State<RequestByPhoneBottomSheet> {

  TextEditingController _phoneController = TextEditingController();

  void _chekButton(bool variable){
    if(_phoneController.text.isNotEmpty){
      setState(() {
        variable = true;
      });
    } else {
      setState(() {
        variable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

  bool _contactIsEmpty = _phoneController.text.isEmpty;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(

        padding: _contactIsEmpty ? EdgeInsets.only(top: 16, left: 16, bottom: 16)
            : EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.close, color: cc.brandColor,),
                            ),
                          ),

                          Text(
                            'Запросить  ',
                            style: tc.bottomSheetLabelStyle,
                          ),

                          SizedBox(height: 36,),

                          Text(
                              'Отправьте запрос, получатель переведёт деньги прямо в приложение, к вам на счёт',
                              maxLines: 3,
                              style: tc.choiceConTextStyle
                          ),

                          SizedBox(height: 36,),


                          Text(
                            'Или введите номер телефона'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,
                            controller: _phoneController,
                            inputFormatters: [
                              formatters.phoneNumberFormatter
                            ],
                            onEditingComplete: (){
                              _chekButton(_contactIsEmpty);
                              FocusManager.instance.primaryFocus?.unfocus();
                            },

                            decoration: const InputDecoration(
                              hintText: '+996  (___) ___ ___',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),

                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                          SizedBox(height: 16,),

                          Text(
                            'Сумма'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.number,

                            decoration: const InputDecoration(
                              hintText: '0',
                              hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),


                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                          SizedBox(height: 16,),

                          Text(
                            'Комментарий'.toUpperCase(),
                            style: tc.bottomSheetHintStyle,
                          ),

                          TextField(
                            cursorHeight: 20,
                            style: tc.inputTextStyle,
                            cursorColor: cc.white,
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              hintText: 'Введите комментарий к запросу',
                              hintStyle: tc.contactHintTextStyle,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),


                          Divider(thickness: 1, color: Color(0xff033144), height: 3,),
                        ],
                      )
                  ),

                  SizedBox(height: 32,),

                  _contactIsEmpty ? Container(
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Вы недавно запрашивали',
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
                  )
                      : SizedBox(),
                ],
              ),
            ),

            _contactIsEmpty ? SizedBox()
                : Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Button(
                  text: 'Отправить запрос',
                  isEnable: true,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
