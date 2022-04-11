part of '../code_phone_screen.dart';

class CodePhoneForm extends StatefulWidget {
  final String verificationId;
  CodePhoneForm({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<CodePhoneForm> createState() => _CodePhoneFormState();
}

class _CodePhoneFormState extends State<CodePhoneForm> {
  ValueNotifier<String> codeText = ValueNotifier('');
  late FocusNode focusNode;

  final firebaseAuth = FirebaseAuth.instance;

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
          hintText: "xxxxxx",
          focusNode: focusNode,
          textInputType: TextInputType.phone,
          inputFormatters: [formatters.pinFormatter],
          onChange: (text) => codeText.value = text,
        ),
        SizedBox(height: 16),
        Spacer(),
        ValueListenableBuilder(
            valueListenable: codeText,
            builder: (context, str, _) {
              return CustomButton(
                text: "Далее",
                isDisabled: false,
                onPressed: () => verifyOTP(),
                backgroundColor: Styles.brandBlue,
              );
            }),
        SizedBox(height: 32),
      ],
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: codeText.value);

    await firebaseAuth.signInWithCredential(credential).whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPinScreen(),
          ),
        );
      },
    );
  }
}
