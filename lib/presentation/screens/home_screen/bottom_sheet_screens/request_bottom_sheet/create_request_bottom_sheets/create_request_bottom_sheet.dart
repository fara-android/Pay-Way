import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/contact.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/choise_container.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/create_request_bottom_sheets/create_request_by_contatct.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/create_request_bottom_sheets/request_by_phone_bottom_sheet.dart';

class CreateRequestBottomSheet extends StatelessWidget {
  const CreateRequestBottomSheet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.all(15),
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
              'Создать запрос',
              style: tc.bottomSheetLabelStyle,
            ),

            SizedBox(height: 36,),


            ChoiceContainer(
              title: 'Выбрать из контактов',
              icon: Icons.person_outline_outlined,
              onPressed: (){
                Navigator.of(context).pop();
                mbsh.showMyBottomSheet(context, CreateRequestByContact(contact: Contact()));
              },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),

            ChoiceContainer(
                title: 'По номеру телефона',
                icon: Icons.call_outlined,
                onPressed: (){
                  Navigator.of(context).pop();
                  mbsh.showMyBottomSheet(context, RequestByPhoneBottomSheet());
                },
            ),

            const Divider(
              thickness: 1,
              color: Color(0xff033144),
              height: 3,
              indent: 25,
            ),


          ],
        ),
      ),
    );
  }
}
