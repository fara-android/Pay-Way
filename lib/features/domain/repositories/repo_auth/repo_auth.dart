import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/login/login_email_model.dart';

abstract class RepoAuth {
  Future<RepoAuthResult> loginEmail({
    required String email,
    required String password,
  });
}

class RepoAuthResult {
  RepoAuthResult({
    this.error,
    this.loginEmailModel,
  });

  final AppError? error;
  final LoginEmailModel? loginEmailModel;

  @override
  String toString() =>
      'RepoAuthResult(error: $error, result: $loginEmailModel)';
}
