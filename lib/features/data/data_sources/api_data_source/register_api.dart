import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';
import 'package:wallet_ui/core/extensions/object.dart';
import 'package:wallet_ui/features/domain/repositories/repo_register/repo_register.dart';

class RegisterUserApi {
  final Dio dio;

  RegisterUserApi({required this.dio});

  Future<RepoUserRegisterResult> regusterUser(
      RegisterUserModel registerUserModel) async {
    try {
      final response =
          await dio.post('auth/register', data: registerUserModel.toJson());

      return RepoUserRegisterResult(user: UserModel.fromJson(response.data));
    } catch (error) {
      return RepoUserRegisterResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }
}
