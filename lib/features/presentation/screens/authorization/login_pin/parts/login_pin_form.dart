part of '../login_pin_screen.dart';

class LoginPinForm extends StatefulWidget {
  LoginPinForm({Key? key}) : super(key: key);

  @override
  State<LoginPinForm> createState() => _LoginPinFormState();
}

class _LoginPinFormState extends State<LoginPinForm> {
  ValueNotifier<String> pinText = ValueNotifier('');
  ValueNotifier<bool> useBiometrics = ValueNotifier(false);
  late FocusNode focusNode;
  late LocalAuthentication localAuth;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.requestFocus();
    localAuth = LocalAuthentication();

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
        SizedBox(height: 16),
        Text(
          "Войти",
          style: Styles.ts32(
            Styles.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Придумайте PIN",
          style: Styles.ts14(
            Styles.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12),
        CustomTextField(
          hintText: "xxxx",
          focusNode: focusNode,
          textInputType: TextInputType.phone,
          inputFormatters: [formatters.pinFormatter],
          onChange: (text) => pinText.value = text,
          obscureeText: true,
        ),
        SizedBox(height: 16),
        Spacer(),
        ValueListenableBuilder(
          valueListenable: pinText,
          builder: (context, str, _) {
            return BlocConsumer<LoginPinCubit, LoginPinState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Menu(),
                      ),
                      (route) => false,
                    );
                  },
                  failed: () {
                    // TODO
                  },
                );
              },
              builder: (context, state) {
                return CustomButton(
                  text: "Войти",
                  isDisabled: pinText.value.length != 4,
                  onPressed: () =>
                      BlocProvider.of<LoginPinCubit>(context).savePinCode(
                    pinCode: pinText.value,
                    useAutenthication: useBiometrics.value,
                  ),
                  backgroundColor: Styles.brandBlue,
                );
              },
            );
          },
        ),
        SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Биометрические данные",
                style: Styles.ts14(
                  Styles.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: useBiometrics,
                builder: (context, str, _) {
                  return Switch(
                    value: useBiometrics.value,
                    inactiveTrackColor: Styles.white,
                    inactiveThumbColor: Styles.brandBlue,
                    activeColor: Styles.white,
                    activeTrackColor: Styles.brandBlue,
                    onChanged: (value) async {
                      useBiometrics.value = value;
                    },
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
