import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/auth/repo_login.dart';

class LoginRepository extends RepoLogin {
  final Repository repository;

  LoginRepository({required this.repository});
  @override
  Future<RepoLoginPhoneResult> generateCode(
      {required String phoneNumber}) async {
    final response =
        await repository.loginApi.generateCode(phoneNumber: phoneNumber);

    if (response.error == null) {
      return RepoLoginPhoneResult(code: response.code);
    }

    return RepoLoginPhoneResult(
        error: AppError(message: response.error!.message));
  }

  @override
  Future<RepoLoginCodeResult> verifyCode({
    required String code,
    required String phoneNumber,
  }) async {
    final response = await repository.loginApi
        .verifyCode(phoneNumber: phoneNumber, code: code);

    if (response.error == null) {
      return RepoLoginCodeResult(user: response.user);
    }

    return RepoLoginCodeResult(
        error: AppError(message: response.error!.message));
  }
}
