part of '../login_phone_screen.dart';

class LoginPhoneForm extends StatefulWidget {
  LoginPhoneForm({Key? key}) : super(key: key);

  @override
  State<LoginPhoneForm> createState() => _LoginPhoneFormState();
}

class _LoginPhoneFormState extends State<LoginPhoneForm> {
  ValueNotifier<String> phoneNumberText = ValueNotifier('');
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        AppLogo(width: 120, height: 120),
        SizedBox(height: 42),
        Text(
          "Войти",
          style: Styles.ts32(
            Styles.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 40),
        Text(
          "ВАШ НОМЕР ТЕЛЕФОНА",
          style: Styles.ts12(Styles.textColor2, fontWeight: FontWeight.w400),
        ),
        CustomTextField(
          hintText: "+996(XXX) XXX XXX",
          focusNode: focusNode,
          textInputType: TextInputType.phone,
          inputFormatters: [formatters.phoneNumberFormatter],
          onChange: (text) => phoneNumberText.value = text,
        ),
        SizedBox(height: 16),
        Spacer(),
        ValueListenableBuilder(
            valueListenable: phoneNumberText,
            builder: (context, str, _) {
              return CustomButton(
                text: "Далее",
                isDisabled: phoneNumberText.value.length != 18,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginCodeScreen(),
                  ),
                ),
                backgroundColor: Styles.brandBlue,
              );
            }),
        SizedBox(height: 32),
      ],
    );
  }
}
