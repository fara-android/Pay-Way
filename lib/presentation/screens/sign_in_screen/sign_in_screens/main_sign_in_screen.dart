import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/screens/sign_in_screen/sign_in_screen_container.dart';
import 'package:wallet_ui/presentation/screens/sign_in_screen/sign_in_screens/enter_number_screen.dart';

class MainSignInScreen extends StatefulWidget {
  const MainSignInScreen({Key? key}) : super(key: key);

  @override
  _MainSignInScreenState createState() => _MainSignInScreenState();
}

class _MainSignInScreenState extends State<MainSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return const SignInScreenContainer(
        containerToPut: EnterNumberScreen(),
        label: 'Войти',
    );
  }
}
