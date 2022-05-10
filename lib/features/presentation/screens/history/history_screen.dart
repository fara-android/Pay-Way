import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/history/history_payments_cubit/history_payments_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/history/widgets/history_payment_container.dart';
import 'package:wallet_ui/service_locator.dart';

part 'parts/history_payments.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shadowColor: Styles.backgroundColor2,
        elevation: 1,
        backgroundColor: Styles.backgroundColor,
        title: Text(
          'История',
          style: Styles.ts18(Styles.white, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (context) => sl<HistoryPaymentsCubit>(),
            child: HistoryPayments(),
          ),
        ),
      ),
    );
  }
}
