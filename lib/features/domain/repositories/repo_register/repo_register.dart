import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';

abstract class RepoUserRegister {
  Future<RepoUserRegisterResult> registerUser(
      RegisterUserModel registerUserModel);
}

class RepoUserRegisterResult {
  RepoUserRegisterResult({
    this.error,
    this.user,
  });

  final AppError? error;
  final UserModel? user;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $user)';
}
