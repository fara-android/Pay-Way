import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/main_screen/user_cubit/user_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_phone/login_phone_screen.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_finance_container.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_form_top_up.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_message_container.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_profile_info_field.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/favorites_custom_banner_container.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/favorites_custom_circle_avatar.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_fast_action_container.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/screens/accept_transfer/accept_transfer.dart';
import 'package:wallet_ui/features/presentation/screens/main/search_screen.dart/search_screen.dart';
import 'package:wallet_ui/features/presentation/screens/main_authorization/login_email_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/countup.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_loading.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';
import 'package:wallet_ui/service_locator.dart';

part 'part/home_appbar.dart';
part 'part/fast_balance_actions.dart';
part 'part/balance.dart';
part 'part/favorites.dart';
part 'part/my_finance.dart';
part 'part/ad_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.brandBlue,
      body: BlocProvider(
        create: (context) => sl<UserCubit>(),
        child: SafeArea(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Column(
                  children: [
                    HomeAppBar(),
                    SizedBox(height: 56),
                    Balance(),
                    SizedBox(height: 48),
                    FastBalanceactions()
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Styles.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Favorites(),
                    SizedBox(height: 32),
                    AdContainer(),
                    SizedBox(height: 32),
                    Description(),
                    SizedBox(height: 32)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
