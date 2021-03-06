import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_ui/core/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onChange;
  final Function(String text)? onSubmitted;
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
  final String? label;
  final String? initialValue;
  final bool hasNext;
  final int? maxLength;

  const CustomTextField({
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
    this.label,
    this.enabled = true,
    this.suffixIcon,
    this.initialValue,
    this.hasNext = false,
    this.onSubmitted,
    this.maxLength,
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
      textInputAction:
          widget.hasNext ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: widget.onSubmitted != null
          ? (text) => widget.onSubmitted!(text)
          : null,
      initialValue: widget.initialValue,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      textCapitalization: TextCapitalization.words,
      cursorColor: Styles.brandBlue,
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        counterStyle: Styles.ts12(Styles.white),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.icon,
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: Styles.ts16(Styles.white.withOpacity(0.5)),
        hintStyle: Styles.ts16(Styles.white.withOpacity(0.5)),
        fillColor: widget.fillColor,
        filled: widget.filled,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.textColor.withOpacity(0.5),
          width: widget.underlineWidth,
        )),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.textColor.withOpacity(0.5),
          width: widget.underlineWidth,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.white,
          width: widget.underlineWidth,
        )),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Styles.white.withOpacity(0.4),
          width: widget.underlineWidth,
        )),
      ),
      onChanged: widget.onChange != null
          ? (text) => setState(() => widget.onChange!(text))
          : null,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
