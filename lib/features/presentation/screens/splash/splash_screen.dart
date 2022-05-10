import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_biometrics/login_biometrics_screen.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_phone/login_phone_screen.dart';
import 'package:wallet_ui/features/presentation/screens/main_authorization/login_email_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_logo.dart';
import 'package:wallet_ui/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Center(
          child: AppLogo(width: 120, height: 120),
        ),
      ),
    );
  }

  _navigatetohome() async {
    final prefs = sl<SharedPreferences>();

    final pinCode = prefs.getString('pinCode');
    final useAuthentication = prefs.getBool('useAuthentication');

    await Future.delayed(Duration(milliseconds: 1500), () {});

    if (pinCode != null && useAuthentication != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginBiometricsScreen(
            useAuthentication: useAuthentication,
            correctCode: pinCode,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginEmailScreen()),
      );
    }
  }
}
