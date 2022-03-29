import 'package:flutter/material.dart';
import 'package:wallet_ui/contact_class/contact.dart';
import 'package:wallet_ui/presentation/constants/colors_const.dart' as cc;
import 'package:wallet_ui/presentation/constants/text_style_const.dart' as tc;

class ContactForList extends StatelessWidget {
  const ContactForList({Key? key, required this.contact, this.onPressed}) : super(key: key);

  final Contact contact;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15,),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundColor: Color(0xff113D6B),
              child: Text('${contact.name[0].toUpperCase()}${contact.lastName.isEmpty ? '' : contact.lastName[0].toUpperCase()}'),
              radius: 30,
            ),

            title: Text(
              contact.name + ' ' + contact.lastName,
              style: tc.choiceConTextStyle,
            ),

            subtitle: Text(
              contact.phone,
              style: tc.contactNumberTextStyle,
            ),

            onTap: onPressed,
          ),

          const Divider(
            height: 5,
            thickness: 1,
            color: Color(0xff033144),
            indent: 65,
          )
        ],
      ),
    );
  }
}
