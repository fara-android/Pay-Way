import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/contact_class/cheks_list.dart' as check_list;
import 'package:wallet_ui/presentation/constants/appBar.dart' as appBar;
import 'package:wallet_ui/presentation/screens/history_screen/histroy_sreen_widgets/history_container.dart';



class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.darkBg,

      appBar: appBar.othersPageAppBar('История'),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [


              Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Все',
                        style: TextStyle(
                          color: cc.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      )
                  ),

                  TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Исходящие',
                        style: TextStyle(
                            color: cc.historyUnselectedCategory,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),

                  TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Входящие',
                        style: TextStyle(
                            color: cc.historyUnselectedCategory,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...check_list.checksList.map((e) => HistoryContainer(check: e))
                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
