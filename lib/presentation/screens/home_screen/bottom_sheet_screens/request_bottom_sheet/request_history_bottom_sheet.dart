import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/contact_class/cheks_list.dart' as ch_list;
import 'package:wallet_ui/presentation/screens/history_screen/histroy_sreen_widgets/history_container.dart';

class RequestsHistoryBottomSheet extends StatelessWidget {
  const RequestsHistoryBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                'История запросов',
                style: tc.bottomSheetLabelStyle,
              ),

              SizedBox(height: 36,),

              Row(

                children: [
                  TextButton(
                      onPressed: (){},
                      child: Text(
                        'Все',
                        style: tc.choiceConTextStyle,
                      )
                  ),

                  TextButton(
                      onPressed: (){},
                      child: Text(
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
                      child: Text(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...ch_list.requestHistoryList.map((e) => HistoryContainer(check: e))
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
