import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/features/data/repository/history_payments_repository.dart';
import 'package:wallet_ui/features/data/repository/login_email_repository.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/data/repository/transfer_money_repository.dart';
import 'package:wallet_ui/features/data/repository/user_repository.dart';
import 'package:wallet_ui/features/domain/repositories/repo_auth/repo_auth.dart';
import 'package:wallet_ui/features/domain/repositories/repo_history_payments/repo_history_payments.dart';
import 'package:wallet_ui/features/domain/repositories/repo_transfer_money/repo_transfer_money.dart';
import 'package:wallet_ui/features/domain/repositories/user/repo_user.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_email_case.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_pin_case.dart';
import 'package:wallet_ui/features/domain/usecases/history/history_payments_case.dart';
import 'package:wallet_ui/features/domain/usecases/transfer_money/transfer_money_case.dart';
import 'package:wallet_ui/features/domain/usecases/user/user_case.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_email_cubit/login_email_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_pin_cubit/login_pin_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/history/history_payments_cubit/history_payments_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/main_screen/user_cubit/user_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/transfer/cubit/transfer_money_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  // Repository
  sl.registerLazySingleton<Repository>(
    () => Repository(),
  );

  sl.registerLazySingleton<RepoAuth>(
    () => LoginEmailRepository(repository: sl()),
  );
  sl.registerLazySingleton<RepoHistoryPayments>(
    () => HistoryPaymentsRepository(repository: sl()),
  );
  sl.registerLazySingleton<RepoTransferMoney>(
    () => TransferMoneyRepository(repository: sl()),
  );
  sl.registerLazySingleton<RepoUser>(
    () => UserRepository(repository: sl()),
  );

  // UseCases
  sl.registerLazySingleton<LoginPinCase>(
    () => LoginPinCase(
      preferences: sl(),
    ),
  );
  sl.registerLazySingleton<TransferMoneyCase>(
    () => TransferMoneyCase(
      repository: sl(),
      preferences: sl(),
    ),
  );
  sl.registerLazySingleton<HistoryPaymentsCase>(
    () => HistoryPaymentsCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<LoginEmailCase>(
    () => LoginEmailCase(
      sharedPreferences: sl(),
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<UserCase>(
    () => UserCase(
      preferences: sl(),
      repository: sl(),
    ),
  );

  // BLoC / Cubit
  sl.registerFactory<LoginPinCubit>(
    () => LoginPinCubit(
      usecase: sl(),
    ),
  );
  sl.registerFactory<LoginEmailCubit>(
    () => LoginEmailCubit(
      loginEmailCase: sl(),
    ),
  );
  sl.registerFactory<HistoryPaymentsCubit>(
    () => HistoryPaymentsCubit(
      historyPaymentsCase: sl(),
    ),
  );
  sl.registerFactory<TransferMoneyCubit>(
    () => TransferMoneyCubit(
      transferMoneyCase: sl(),
    ),
  );
  sl.registerFactory<UserCubit>(
    () => UserCubit(userCase: sl()),
  );
}
