import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';
import 'package:wallet_ui/features/domain/repositories/auth/repo_login.dart';
import 'package:wallet_ui/core/extensions/object.dart';

class LoginApi {
  final Dio dio;

  LoginApi({required this.dio});

  Future<RepoLoginPhoneResult> generateCode({
    required String phoneNumber,
  }) async {
    try {
      final response =
          await dio.post('auth/generateCode', data: {'phone': phoneNumber});

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
      final response = await dio.post('auth/generateCode', data: {
        'phone': phoneNumber,
        'code': code,
      });

      return RepoLoginCodeResult(user: UserModel.fromJson(response.data));
    } catch (error) {
      return RepoLoginCodeResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }
}
