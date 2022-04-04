import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_finance_container.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_profile_info_field.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/favorites_custom_banner_container.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/favorites_custom_circle_avatar.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_fast_action_container.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

part 'part/home_appbar.dart';
part 'part/fast_balance_actions.dart';
part 'part/balance.dart';
part 'part/favorites.dart';
part 'part/my_finance.dart';
part 'part/ad_container.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.brandBlue,
      body: SafeArea(
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
              color: Styles.backgroundColor,
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
    );
  }
}
