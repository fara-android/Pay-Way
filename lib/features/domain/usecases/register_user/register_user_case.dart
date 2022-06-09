import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/domain/repositories/repo_register/repo_register.dart';

class RegisterUserCase {
  final RepoUserRegister repository;

  RegisterUserCase({required this.repository});

  Future<RepoUserRegisterResult> registerUser(
      RegisterUserModel registerUserModel) async {
    final response = await repository.registerUser(registerUserModel);

    return response;
  }
}
