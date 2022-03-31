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
    canCheckBiometrics();

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
            return CustomButton(
              text: "Войти",
              isDisabled: pinText.value.length != 4,
              onPressed: () => authenticate(),
              //   onPressed: () => Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => MainScreen(),
              //     ),
              //     (route) => false,
              //   ),
              backgroundColor: Styles.brandBlue,
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

  Future<bool> canCheckBiometrics() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    return canCheckBiometrics;
  }

  void authenticate() async {
    final _canCheckBio = await canCheckBiometrics();
    if (_canCheckBio) {
      final successAuthentication = await localAuth.authenticate(
        localizedReason: 'Подтвердите биометрические данные для входа',
        biometricOnly: true,
        useErrorDialogs: false,
        stickyAuth: true,
      );
    }
  }
}
