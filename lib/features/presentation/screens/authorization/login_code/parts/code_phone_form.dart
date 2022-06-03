part of '../code_phone_screen.dart';

class CodePhoneForm extends StatefulWidget {
  final String phoneNumber;
  final String code;
  CodePhoneForm({
    Key? key,
    required this.phoneNumber,
    required this.code,
  }) : super(key: key);

  @override
  State<CodePhoneForm> createState() => _CodePhoneFormState();
}

class _CodePhoneFormState extends State<CodePhoneForm> {
  ValueNotifier<String> codeText = ValueNotifier('');
  ValueNotifier<bool> isLoading = ValueNotifier(false);
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
        MultiValueListenableBuilder(
          first: codeText,
          second: isLoading,
          doubleBuilder: (context, str, _) {
            return BlocListener<LoginCodeCubit, LoginCodeState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loading: () => isLoading.value = true,
                  loaded: (user) {
                    isLoading.value = false;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPinScreen(),
                      ),
                    );
                  },
                  failed: (error) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPinScreen(),
                      ),
                    );
                    // isLoading.value = false;
                    // AppToasts().showBottomToast(error, context, true);
                  },
                );
              },
              child: CustomButton(
                text: "Далее",
                isDisabled: false,
                loading: isLoading.value,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  BlocProvider.of<LoginCodeCubit>(context).verifyCode(
                    phoneNumber: widget.phoneNumber
                        .replaceAll('(', '')
                        .replaceAll(')', '')
                        .replaceAll(' ', ''),
                    code: widget.code,
                  );
                },
                backgroundColor: Styles.brandBlue,
              ),
            );
          },
        ),
        SizedBox(height: 32),
      ],
    );
  }

  // void verifyOTP() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: widget.verificationId, smsCode: codeText.value);

  //   await firebaseAuth.signInWithCredential(credential).whenComplete(
  //     () {
  // Navigator.pushReplacement(
  //   context,
  //   MaterialPageRoute(
  //     builder: (context) => LoginPinScreen(),
  //   ),
  // );
  //     },
  //   );
  // }
}
