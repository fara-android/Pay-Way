import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/features/domain/repositories/auth/repo_login.dart';

class LoginCase {
  final RepoLogin repository;
  final SharedPreferences preferences;

  LoginCase({
    required this.repository,
    required this.preferences,
  });

  Future<RepoLoginPhoneResult> generateCode(
      {required String phoneNumber}) async {
    final response = await repository.generateCode(phoneNumber: phoneNumber);

    return response;
  }

  Future<RepoLoginCodeResult> verifyCode(
      {required String phoneNumber, required String code}) async {
    final response =
        await repository.verifyCode(phoneNumber: phoneNumber, code: code);

    return response;
  }
}
