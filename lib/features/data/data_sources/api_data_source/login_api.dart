import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/domain/repositories/auth/repo_login.dart';
import 'package:wallet_ui/core/extensions/object.dart';

class LoginApi {
  final Dio dio;

  LoginApi({required this.dio});

  Future<RepoLoginPhoneResult> generateCode({
    required String phoneNumber,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        // queryParameters: {
        //   'email': email,
        //   'password': password,
        //   'remember': 0,
        // },
      );

      return RepoLoginPhoneResult(code: response.data['code']);
    } catch (error) {
      return RepoLoginPhoneResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }

  Future<RepoLoginCodeResult> verifyCode({
    required String phoneNumber,
    required String code,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        // queryParameters: {
        //   'email': email,
        //   'password': password,
        //   'remember': 0,
        // },
      );

      return RepoLoginCodeResult(code: response.data['code']);
    } catch (error) {
      return RepoLoginCodeResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }
}
