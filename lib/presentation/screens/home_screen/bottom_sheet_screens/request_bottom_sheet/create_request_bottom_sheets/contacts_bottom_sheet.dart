import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/bottom_sheet_widgets/contact_container_for_list.dart';
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/my_modal_bottom_sheet.dart' as mbsh;
import 'package:wallet_ui/presentation/screens/home_screen/bottom_sheet_screens/request_bottom_sheet/create_request_bottom_sheets/create_request_by_contatct.dart';
import 'package:wallet_ui/presentation/screens/payments_screen/payment_screen_widgets/search_bar.dart';
import 'package:wallet_ui/contact_class/contacts_list.dart' as contacts;

class ContactsBottomSheet extends StatefulWidget {
  const ContactsBottomSheet({Key? key}) : super(key: key);

  @override
  _ContactsBottomSheetState createState() => _ContactsBottomSheetState();
}

class _ContactsBottomSheetState extends State<ContactsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
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
                'Выберите контакт',
                style: tc.bottomSheetLabelStyle,
              ),

              SizedBox(height: 16,),

              SearchBar(),

              Column(
                children: [
                  ...contacts.contactsList.map((e) => ContactForList(
                    contact: e,
                    onPressed: (){
                      Navigator.of(context).pop();
                      mbsh.showMyBottomSheet(context, CreateRequestByContact(contact: e));
                    },
                    )
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
