import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/features/data/repository/history_payments_repository.dart';
import 'package:wallet_ui/features/data/repository/login_email_repository.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/repo_auth/repo_auth.dart';
import 'package:wallet_ui/features/domain/repositories/repo_history_payments/repo_history_payments.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_email_case.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_pin_case.dart';
import 'package:wallet_ui/features/domain/usecases/history/history_payments_case.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_email_cubit/login_email_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_pin_cubit/login_pin_cubit.dart';
import 'package:wallet_ui/features/presentation/cubits/history/history_payments_cubit/history_payments_cubit.dart';

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

  // UseCases
  sl.registerLazySingleton<LoginPinCase>(
    () => LoginPinCase(
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
}
