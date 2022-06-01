import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/domain/repositories/user/repo_user.dart';

class UserCase {
  final RepoUser repository;
  final SharedPreferences preferences;

  UserCase({
    required this.repository,
    required this.preferences,
  });

  Future<RepoUserResult> getUser() async {
    final userId = preferences.getInt('userId');

    if (userId != null) {
      final response = await repository.getUser(userId: userId);
      return response;
    } else {
      return RepoUserResult(error: AppError(message: 'Пользователь не найден'));
    }
  }
}
