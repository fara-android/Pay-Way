import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';

abstract class RepoLogin {
  Future<RepoLoginPhoneResult> generateCode({required String phoneNumber});
  Future<RepoLoginCodeResult> verifyCode({
    required String code,
    required String phoneNumber,
  });
}

class RepoLoginPhoneResult {
  final AppError? error;
  final String? code;

  RepoLoginPhoneResult({
    this.error,
    this.code,
  });

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $code)';
}

class RepoLoginCodeResult {
  final AppError? error;
  final UserModel? user;

  RepoLoginCodeResult({
    this.error,
    this.user,
  });

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $user)';
}
