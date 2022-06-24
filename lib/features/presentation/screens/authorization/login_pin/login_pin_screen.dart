import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_pin_cubit/login_pin_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/menu/menu.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'parts/login_pin_form.dart';

class LoginPinScreen extends StatelessWidget {
  const LoginPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: BlocProvider(
        create: (context) => sl<LoginPinCubit>(),
        child: SafeArea(
          child: Container(
            height: Styles.getHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LoginPinForm(),
          ),
        ),
      ),
    );
  }
}
