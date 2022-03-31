import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_phone/login_phone_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPhoneScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
          child: Center(child: AppLogo(width: 120, height: 120))),
    );
  }
}
