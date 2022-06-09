import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/repo_register/repo_register.dart';

class RegisterUserRepository extends RepoUserRegister {
  final Repository repository;

  RegisterUserRepository({required this.repository});
  @override
  Future<RepoUserRegisterResult> registerUser(
      RegisterUserModel registerUserModel) async {
    final response =
        await repository.registerUserApi.regusterUser(registerUserModel);
    if (response.error == null) {
      return RepoUserRegisterResult(user: response.user);
    } else {
      return RepoUserRegisterResult(
          error: AppError(message: response.error!.message));
    }
  }
}
