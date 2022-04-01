import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/components/custom_fast_action_container.dart';

part 'part/home_appbar.dart';
part 'part/fast_balance_actions.dart';
part 'part/balance.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor2,
      body: SafeArea(
        child: Column(
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
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
