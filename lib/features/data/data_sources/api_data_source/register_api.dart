import 'package:http_parser/http_parser.dart';
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
      var data = FormData.fromMap(registerUserModel.toJson());
      data.files.addAll([
        MapEntry(
          'licevaya_storona_pasporta',
          MultipartFile.fromFileSync(
            registerUserModel.passportFront!.path,
            contentType: MediaType.parse('multipart/form-data'),
          ),
        ),
        MapEntry(
          'zadnyaya_storona_pasporta',
          MultipartFile.fromFileSync(
            registerUserModel.passportBack!.path,
            contentType: MediaType.parse('multipart/form-data'),
          ),
        ),
        MapEntry(
          'selfi_s_pasportom',
          MultipartFile.fromFileSync(
            registerUserModel.passportBack!.path, // TOODO Изменить
            contentType: MediaType.parse('multipart/form-data'),
          ),
        ),
      ]);

      final response = await dio.post('auth/register', data: data);

      return RepoUserRegisterResult(user: UserModel.fromJson(response.data));
    } catch (error) {
      return RepoUserRegisterResult(
        error: AppError(message: error.dioErrorMessage),
      );
    }
  }
}
