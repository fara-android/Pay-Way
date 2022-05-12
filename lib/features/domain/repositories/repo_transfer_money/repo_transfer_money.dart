import 'package:wallet_ui/core/app_error.dart';

abstract class RepoTransferMoney {
  Future<RepoTransferMoneyResult> transferMoney({
    required String receiver,
    required int walletId,
    required String amount,
  });
}

class RepoTransferMoneyResult {
  RepoTransferMoneyResult({
    this.error,
    this.result,
  });

  final AppError? error;
  final String? result;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $result)';
}
