import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                Container(
                  width: 270,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Color(0xff022D3F),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Center(
                    child: TextField(
                      style: TextStyle(color: Styles.textColor, fontSize: 18),
                      cursorColor: Styles.textColor,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff053950),
                          ),
                          hintText: 'Введите ключевое слово',
                          contentPadding: EdgeInsets.all(13),
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Color(0xff053950),
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap:()=> Navigator.pop(context),
                  child: Text(
                    "Отменить",
                    style: TextStyle(color: Styles.backgroundColor2),
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xff053950))
          ],
        ),
      ),
    );
  }
}
