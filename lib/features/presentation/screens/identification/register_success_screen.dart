import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/menu/menu.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 32),
              Image.asset('assets/images/success_register.png'),
              SizedBox(height: 8),
              Text(
                'Спасибо!',
                style: Styles.ts24(
                  Styles.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Ваша заявка на идентификацию на рассмотрении. Наш специалист в кратчайшие сроки расммотрит и даст вам ответ',
                style: Styles.ts16(Styles.white),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomButton(
                text: 'Понятно',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Menu()),
                      (route) => false);
                },
                backgroundColor: Styles.backgroundColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
