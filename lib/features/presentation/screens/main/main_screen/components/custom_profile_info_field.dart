import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';

import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';

class CustomProfileinfoField extends StatelessWidget {
  final String title;
  final bool enabled;
  final TextEditingController? controller;
  final String? defaultValue;
  const CustomProfileinfoField({
    Key? key,
    required this.title,
    this.enabled = false,
    this.controller,
    this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: defaultValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Styles.ts12(Styles.inActiveColor),
        ),
        CustomTextField(
          underlineWidth: 0.3,
          enabled: enabled,
          controller: enabled ? _controller : _controller,
        ),
      ],
    );
  }
}
