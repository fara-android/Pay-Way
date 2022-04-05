import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_phone/login_phone_screen.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/main_screen.dart';
import 'package:wallet_ui/features/presentation/screens/menu/menu.dart';
import 'package:wallet_ui/service_locator.dart';

class LoginBiometricsScreen extends StatefulWidget {
  final String correctCode;
  final bool useAuthentication;
  const LoginBiometricsScreen({
    Key? key,
    required this.correctCode,
    required this.useAuthentication,
  }) : super(key: key);

  @override
  State<LoginBiometricsScreen> createState() => _LoginBiometricsScreenState();
}

class _LoginBiometricsScreenState extends State<LoginBiometricsScreen> {
  late LocalAuthentication localAuth;
  List<BiometricType> availableBiometrics = [];

  @override
  void initState() {
    localAuth = LocalAuthentication();
    if (widget.useAuthentication) {
      authenticate();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: ScreenLock(
        correctString: widget.correctCode,
        title: Text('Введите ПИН'),
        confirmTitle: Text('Введите ПИН'),
        footer: Container(
          padding: EdgeInsets.only(
            top: Styles.getHeight(context) / 10,
          ),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              final prefs =
                  sl<SharedPreferences>(); // TODO: Сделать по правилам
              prefs.remove('pinCode');
              prefs.remove('useAuthentication');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPhoneScreen(),
                ),
                (route) => false,
              );
            },
            child: Text(
              'Забыли пароль?',
              style: Styles.ts14(Styles.inActiveColor),
            ),
          ),
        ),
        cancelButton: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: () {},
        ),
        customizedButtonTap: () async {},
        customizedButtonChild: widget.useAuthentication
            ? InkWell(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
                onTap: () => authenticate(),
                child: Icon(
                  Icons.fingerprint,
                  size: 36,
                ),
              )
            : InkWell(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
                onTap: () {},
              ),
        didUnlocked: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(),
            ),
            (route) => false,
          ),
      ),
    );
  }

  Future<bool> canCheckBiometrics() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    return canCheckBiometrics;
  }

  void authenticate() async {
    try {
      final _canCheckBio = await canCheckBiometrics();
      if (_canCheckBio) {
        final successAuthentication = await localAuth.authenticate(
          localizedReason: 'Подтвердите биометрические данные для входа',
          androidAuthStrings: AndroidAuthMessages(
            biometricRequiredTitle: '',
            biometricHint: '',
            signInTitle: '  ',
            cancelButton: 'Отменить',
          ),
          biometricOnly: true,
          useErrorDialogs: false,
          stickyAuth: true,
        );
        if (successAuthentication) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Menu(),
            ),
            (route) => false,
          );
        }
      }
    } on Object catch (e) {}
  }
}
