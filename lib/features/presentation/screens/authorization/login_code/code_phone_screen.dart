import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_code_cubit/login_code_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_pin/login_pin_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;
import 'package:wallet_ui/features/presentation/widgets/multi_value_listanable_builder.dart';
import 'package:wallet_ui/service_locator.dart';

part 'parts/code_phone_form.dart';

class LoginCodeScreen extends StatelessWidget {
  final String phoneNumber;

  const LoginCodeScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Container(
            height: Styles.getHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocProvider(
              create: (context) => sl<LoginCodeCubit>(),
              child: CodePhoneForm(
                phoneNumber: phoneNumber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
