import 'package:wallet_ui/core/app_error.dart';

abstract class RepoLoginPin {
  Future<bool> safePinCode();
}

class RepoLoginPinResult {
  RepoLoginPinResult({
    this.error,
    this.result,
  });

  final AppError? error;
  final bool? result;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $result)';
}
