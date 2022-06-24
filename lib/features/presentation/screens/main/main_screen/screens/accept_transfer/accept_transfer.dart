import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/cubits/main_screen/user_cubit/user_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/transfer/cubit/transfer_money_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/menu/menu.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/service_locator.dart';

part 'parts/user_info.dart';
part 'parts/transfer_info.dart';

class AcceptTransferScreen extends StatefulWidget {
  final String reciver;
  final String amount;
  AcceptTransferScreen({
    Key? key,
    required this.reciver,
    required this.amount,
  }) : super(key: key);

  @override
  State<AcceptTransferScreen> createState() => _AcceptTransferScreenState();
}

class _AcceptTransferScreenState extends State<AcceptTransferScreen> {
  final transferCubit = sl<TransferMoneyCubit>();
  final isTransferLoadingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        elevation: 0,
        title: Text('Подтвердите платеж'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              BlocProvider(
                create: (context) => sl<UserCubit>(),
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => SizedBox(),
                      loading: () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '',
                            style: Styles.ts18(
                              Styles.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Divider(
                            color: Styles.white,
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ваш Баланс :',
                                style: Styles.ts18(
                                  Styles.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '',
                                style: Styles.ts18(
                                  Styles.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      loaded: (user) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.user?.name ?? '',
                            style: Styles.ts18(
                              Styles.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Divider(
                            color: Styles.white,
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ваш Баланс :',
                                style: Styles.ts18(
                                  Styles.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                // '${user.data?.wallets?.first.balance} сом',
                                '0',
                                style: Styles.ts18(
                                  Styles.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      failed: (e) => SizedBox(),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Styles.backgroundColor2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Получатель',
                      style: Styles.ts14(Styles.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.reciver,
                      style: Styles.ts16(Styles.grey4),
                    ),
                    Divider(
                      color: Styles.white,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Сумма',
                      style: Styles.ts14(Styles.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${widget.amount} сом',
                      style: Styles.ts16(Styles.grey4),
                    ),
                    Divider(
                      color: Styles.white,
                    ),
                    SizedBox(height: 16),
                    Row(children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Комиссия',
                              style: Styles.ts16(
                                Styles.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              '0 %',
                              style: Styles.ts16(Styles.grey4),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Сумма комисии',
                              style: Styles.ts16(
                                Styles.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              '0 сом',
                              style: Styles.ts16(Styles.grey4),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    Divider(
                      color: Styles.white,
                    ),
                  ],
                ),
              ),
              Spacer(),
              BlocProvider.value(
                value: transferCubit,
                child: BlocListener<TransferMoneyCubit, TransferMoneyState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loading: () {
                        isTransferLoadingNotifier.value = true;
                      },
                      success: (_) {
                        isTransferLoadingNotifier.value = false;
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Menu()),
                          (route) => false,
                        );
                        AppToasts().showBottomToast(_, context);
                      },
                      failed: (_) {
                        isTransferLoadingNotifier.value = false;
                        AppToasts().showBottomToast(_, context, true);
                      },
                    );
                  },
                  child: ValueListenableBuilder(
                    valueListenable: isTransferLoadingNotifier,
                    builder: (context, str, _) {
                      return CustomButton(
                        loading: isTransferLoadingNotifier.value,
                        text: 'Перевести',
                        onPressed: () {
                          transferCubit.transferMoney(
                            receiver: widget.reciver,
                            amount: widget.amount,
                          );
                        },
                        backgroundColor: Styles.brandBlue,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
