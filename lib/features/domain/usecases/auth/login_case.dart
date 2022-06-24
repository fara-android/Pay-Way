import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/features/domain/repositories/auth/repo_login.dart';
import 'package:wallet_ui/service_locator.dart';

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
    final prefs = sl<SharedPreferences>();

    final response =
        await repository.verifyCode(phoneNumber: phoneNumber, code: code);
    if (response.user != null) {
      if (response.user!.user?.kycStatus != null) {
        prefs.setInt('kyc_status', response.user!.user!.kycStatus!);
      }
      if (response.user!.user?.kycText != null) {
        prefs.setString('kyc_text', response.user!.user!.kycText!.toString());
      }
    }
    return response;
  }
}
