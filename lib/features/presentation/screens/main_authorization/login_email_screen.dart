import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_email_cubit/login_email_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/menu/menu.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/service_locator.dart';

part 'parts/login_email_form.dart';

class LoginEmailScreen extends StatelessWidget {
  LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocProvider(
              create: (context) => sl<LoginEmailCubit>(),
              child: LoginEmailForm(),
            ),
          ),
        ),
      ),
    );
  }
}
