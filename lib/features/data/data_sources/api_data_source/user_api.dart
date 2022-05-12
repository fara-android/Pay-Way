import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/login/login_email_model.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';
import 'package:wallet_ui/features/domain/repositories/repo_auth/repo_auth.dart';
import 'package:wallet_ui/core/extensions/object.dart';
import 'package:wallet_ui/features/domain/repositories/user/repo_user.dart';

class UserApi {
  final Dio dio;

  UserApi({required this.dio});

  Future<RepoUserResult> getUser({required int userId}) async {
    try {
      final response = await dio.get('user/$userId');

      return RepoUserResult(user: UserModel.fromJson(response.data));
    } catch (error) {
      return RepoUserResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }
}
