

part of '../code_phone_screen.dart';

class CodePhoneForm extends StatefulWidget {
  CodePhoneForm({Key? key}) : super(key: key);

  @override
  State<CodePhoneForm> createState() => _CodePhoneFormState();
}

class _CodePhoneFormState extends State<CodePhoneForm> {
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
      children: [
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
          "Введите код из СМС".toUpperCase(),
          style: Styles.ts12(Styles.textColor2, fontWeight: FontWeight.w400),
        ),
        CustomTextField(
          hintText: "xxxx",
          focusNode: focusNode,
          textInputType: TextInputType.phone,
          inputFormatters: [formatters.pinFormatter],
          onChange: (text) {},
          obscureeText: true,
        ),
        SizedBox(height: 16),
        Spacer(),
        CustomButton(
          text: "Далее",
          isDisabled: false,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FaceIdPhoneScreen(),
              ),
            );
          },
          backgroundColor: Styles.brandBlue,
        ),
        SizedBox(height: 32),
      ],
    );
  }
}