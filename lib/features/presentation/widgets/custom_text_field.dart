import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onChange;
  final Icon? icon;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Color borderColor;
  final TextInputType? textInputType;
  final bool obscureeText;
  final FocusNode? focusNode;
  final double underlineWidth;
  final bool enabled;

  const 
  CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.inputFormatters,
    this.onChange,
    this.icon,
    this.filled,
    this.focusNode,
    this.fillColor,
    this.borderColor = Styles.textColor,
    this.textInputType,
    this.obscureeText = false,
    this.underlineWidth = 1.0,
    this.enabled = true,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.ts16(Styles.textColor),
      obscureText: widget.obscureeText,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      cursorColor: Styles.brandBlue,
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.icon,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: widget.fillColor,
        filled: widget.filled,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.textColor,
          width: widget.underlineWidth,
        )),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.textColor,
          width: widget.underlineWidth,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.textColor,
          width: widget.underlineWidth,
        )),
      ),
      onChanged: widget.onChange != null
          ? (text) => setState(() => widget.onChange!(text))
          : null,
    );
  }
}
