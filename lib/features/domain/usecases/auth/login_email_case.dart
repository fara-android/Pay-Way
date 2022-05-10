import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/domain/repositories/repo_auth/repo_auth.dart';

class LoginEmailCase {
  final RepoAuth repository;
  final SharedPreferences sharedPreferences;

  LoginEmailCase({
    required this.repository,
    required this.sharedPreferences,
  });

  Future<RepoAuthResult> loginEmail({
    required String email,
    required String password,
  }) async {
    final response =
        await repository.loginEmail(email: email, password: password);
    if (response.error == null) {
      sharedPreferences.setString('token', response.token!);
      return response;
    }

    return RepoAuthResult(error: AppError(message: response.error!.message));
  }
}
