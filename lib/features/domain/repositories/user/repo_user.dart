import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';

abstract class RepoUser {
  Future<RepoUserResult> getUser({required int userId});
}

class RepoUserResult {
  RepoUserResult({
    this.error,
    this.user,
  });

  final AppError? error;
  final UserModel? user;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $user)';
}
