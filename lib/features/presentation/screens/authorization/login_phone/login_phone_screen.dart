import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_phone_cubit/login_phone_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_code/code_phone_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/features/presentation/widgets/multi_value_listanable_builder.dart';
import 'package:wallet_ui/service_locator.dart';

part 'parts/login_phone_form.dart';

class LoginPhoneScreen extends StatelessWidget {
  LoginPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (context) => sl<LoginPhoneCubit>(),
            child: LoginPhoneForm(),
          ),
        ),
      ),
    );
  }
}
