import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/user/repo_user.dart';

class UserRepository extends RepoUser {
  final Repository repository;

  UserRepository({required this.repository});
  @override
  Future<RepoUserResult> getUser({required int userId}) async {
    final response = await repository.userApi.getUser(userId: userId);

    if (response.error == null) {
      return RepoUserResult(user: response.user);
    }

    return RepoUserResult(error: AppError(message: response.error!.message));
  }
}
