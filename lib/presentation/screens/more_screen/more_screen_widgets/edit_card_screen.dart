import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/presentation/constants/appBar.dart' as appBar;
import 'package:wallet_ui/contact_class/card_class.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen_widgets/button.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({Key? key, required this.card}) : super(key: key);
  final CardClass card;

  @override
  _EditCardScreenState createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {

  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardNameControler = TextEditingController();
  TextEditingController _cardDateController = TextEditingController();
  TextEditingController _cardCvcController = TextEditingController();

  @override
  void initState() {
    _getCard();
    super.initState();
  }

  void _getCard(){
    setState(() {
      _cardNameControler.text = widget.card.name;
      _cardNumberController.text = widget.card.number;
      _cardDateController.text = widget.card.date;
      _cardCvcController.text = widget.card.cvc;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: cc.darkBg,

      appBar: appBar.othersPageAppBar('Мои карты'),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    SizedBox(height: 24,),

                    Text(
                      widget.card.name,
                      style: tc.bottomSheetLabelStyle,
                    ),
                    SizedBox(height: 48,),

                    Text(
                      'Название карты'.toUpperCase(),
                      style: tc.bottomSheetHintStyle,
                    ),

                    SizedBox(height: 16,),

                    TextField(
                      cursorHeight: 20,
                      style: tc.inputTextStyle,
                      cursorColor: cc.white,
                      keyboardType: TextInputType.text,
                      controller: _cardNameControler,
                      inputFormatters: [
                        formatters.cardNumberFormatter
                      ],

                      decoration: const InputDecoration(
                        hintText: 'Ввидите имя карты',
                        hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                    Divider(thickness: 1, color: Color(0xff033144), height: 3,),


                    SizedBox(height: 16,),
                    Text(
                      'Номер карты'.toUpperCase(),
                      style: tc.bottomSheetHintStyle,
                    ),

                    SizedBox(height: 16,),

                    TextField(
                      cursorHeight: 20,
                      style: tc.inputTextStyle,
                      cursorColor: cc.white,
                      keyboardType: TextInputType.number,
                      controller: _cardNumberController,
                      inputFormatters: [
                        formatters.cardNumberFormatter
                      ],

                      decoration: const InputDecoration(
                        hintText: '**** **** **** ****',
                        hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),

                    Divider(thickness: 1, color: Color(0xff033144), height: 3,),

                    SizedBox(height: 28,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'мм/гг'.toUpperCase(),
                                  style: tc.bottomSheetHintStyle,
                                ),

                                SizedBox(height: 10),

                                TextField(
                                  cursorHeight: 20,
                                  style: tc.inputTextStyle,
                                  cursorColor: cc.white,
                                  keyboardType: TextInputType.number,
                                  controller: _cardDateController,
                                  inputFormatters: [
                                    formatters.cardDateFormatter
                                  ],

                                  decoration: const InputDecoration(
                                    hintText: '00/00',
                                    hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                ),

                                Divider(thickness: 1, color: Color(0xff033144), height: 3, endIndent: 30,)
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'cvc'.toUpperCase(),
                                  style: tc.bottomSheetHintStyle,
                                ),

                                SizedBox(height: 10),

                                TextField(
                                  cursorHeight: 20,
                                  style: tc.inputTextStyle,
                                  cursorColor: cc.white,
                                  keyboardType: TextInputType.number,
                                  controller: _cardCvcController,
                                  inputFormatters: [
                                    formatters.cvcFormatter
                                  ],

                                  decoration: const InputDecoration(
                                    hintText: '000',
                                    hintStyle: TextStyle(color: Color(0xffbdbdbd)),
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                  ),
                                ),

                                Divider(thickness: 1, color: Color(0xff033144), height: 3,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 16,),

                  ],
                ),
              ),
              
              Button(
                  text: 'Сохранить изменения',
                  isEnable: true,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
              )
            ],
          ),
        )
      ),
    );
  }
}
