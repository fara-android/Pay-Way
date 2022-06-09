part of '../login_phone_screen.dart';

class LoginPhoneForm extends StatefulWidget {
  LoginPhoneForm({Key? key}) : super(key: key);

  @override
  State<LoginPhoneForm> createState() => _LoginPhoneFormState();
}

class _LoginPhoneFormState extends State<LoginPhoneForm> {
  ValueNotifier<String> phoneNumberText = ValueNotifier('');
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
      children: <Widget>[
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
          "ВАШ НОМЕР ТЕЛЕФОНА",
          style: Styles.ts12(Styles.textColor2, fontWeight: FontWeight.w400),
        ),
        CustomTextField(
          hintText: "+996(XXX) XXX XXX",
          focusNode: focusNode,
          initialValue: '+996 ',
          textInputType: TextInputType.phone,
          inputFormatters: [formatters.phoneNumberFormatter],
          onChange: (text) => phoneNumberText.value = text,
        ),
        SizedBox(height: 16),
        Spacer(),
        BlocListener<LoginPhoneCubit, LoginPhoneState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loading: () {
                isLoading.value = true;
              },
              loaded: (code) {
                isLoading.value = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginCodeScreen(
                      phoneNumber: phoneNumberText.value,
                    ),
                  ),
                );
              },
              failed: (error) {
                isLoading.value = false;
                AppToasts().showBottomToast(error, context, true);
              },
            );
          },
          child: MultiValueListenableBuilder(
            first: phoneNumberText,
            second: isLoading,
            doubleBuilder: (context, str, _) {
              return CustomButton(
                text: "Далее",
                isDisabled: phoneNumberText.value.length != 18,
                loading: isLoading.value,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  phoneNumberText.value
                      .replaceAll('(', '')
                      .replaceAll(')', '')
                      .replaceAll(' ', '');
                  BlocProvider.of<LoginPhoneCubit>(context).generateCode(
                      phoneNumber: phoneNumberText.value
                          .replaceAll('(', '')
                          .replaceAll(')', '')
                          .replaceAll(' ', ''));
                },
                backgroundColor: Styles.brandBlue,
              );
            },
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
