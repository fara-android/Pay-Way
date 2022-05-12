import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/domain/repositories/repo_transfer_money/repo_transfer_money.dart';
import 'package:wallet_ui/core/extensions/object.dart';

class TransferMoneyApi {
  final Dio dio;

  TransferMoneyApi({required this.dio});

  Future<RepoTransferMoneyResult> transferMoney({
    required String receiver,
    required int walletId,
    required String amount,
  }) async {
    try {
      final response = await dio.post(
        'transfer-money',
        queryParameters: {
          'receiver': receiver,
          'wallet_id': walletId,
          'amount': amount,
        },
      );

      return RepoTransferMoneyResult(result: response.data['success']);
    } catch (e) {
      return RepoTransferMoneyResult(
        error: AppError(
          message: e.dioErrorMessage,
        ),
      );
    }
  }
}
