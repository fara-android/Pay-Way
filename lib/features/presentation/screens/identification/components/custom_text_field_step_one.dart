import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';

class CustomTextfieldStep extends StatelessWidget {
  final String labelTextt;
  final TextEditingController? controller;
  final String? defaultValue;
  const CustomTextfieldStep({
    Key? key,
    this.controller,
    this.defaultValue,
    required this.labelTextt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: defaultValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff033144),
              ),
            ),
            // enabled: false,
            labelText: labelTextt,
            labelStyle: TextStyle(color: Styles.textColor2, fontSize: 16),
          ),
        ),
        SizedBox(height: 12)
      ],
    );
  }
}
