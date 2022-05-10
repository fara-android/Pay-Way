import 'package:wallet_ui/core/app_error.dart';

abstract class RepoAuth {
  Future<RepoAuthResult> loginEmail({
    required String email,
    required String password,
  });
}

class RepoAuthResult {
  RepoAuthResult({
    this.error,
    this.token,
  });

  final AppError? error;
  final String? token;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $token)';
}
