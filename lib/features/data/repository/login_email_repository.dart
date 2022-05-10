import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/repo_auth/repo_auth.dart';

class LoginEmailRepository extends RepoAuth {
  final Repository repository;

  LoginEmailRepository({required this.repository});
  @override
  Future<RepoAuthResult> loginEmail({
    required String email,
    required String password,
  }) async {
    final response = await repository.loginEmailApi
        .loginEmail(email: email, password: password);

    if (response.error == null) {
      return RepoAuthResult(token: response.token);
    }

    return RepoAuthResult(error: AppError(message: response.error!.message));
  }
}
