import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/domain/repositories/repo_auth/repo_auth.dart';
import 'package:wallet_ui/core/extensions/object.dart';

class LoginEmailApi {
  final Dio dio;

  LoginEmailApi({required this.dio});

  Future<RepoAuthResult> loginEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        queryParameters: {
          'email': email,
          'password': password,
          'remember': 0,
        },
      );

      return RepoAuthResult(token: response.data['token']);
    } catch (error) {
      return RepoAuthResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }
}
