import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_pin_case.dart';
import 'package:wallet_ui/features/presentation/cubits/auth/login_pin_cubit/login_pin_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  // Repository
  // sl.registerLazySingleton<Repository>(
  //   () => Repository(),
  // );

  // sl.registerLazySingleton<RepoAuth>(
  //   () => AuthRepository(repository: sl()),
  // );

  // UseCases
  sl.registerLazySingleton<LoginPinCase>(
    () => LoginPinCase(
      preferences: sl(),
    ),
  );

  // BLoC / Cubit
  sl.registerFactory<LoginPinCubit>(
    () => LoginPinCubit(
      usecase: sl(),
    ),
  );
}
