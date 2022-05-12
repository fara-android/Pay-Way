import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/domain/usecases/transfer_money/transfer_money_case.dart';

part 'transfer_money_cubit.freezed.dart';

class TransferMoneyCubit extends Cubit<TransferMoneyState> {
  final TransferMoneyCase transferMoneyCase;
  TransferMoneyCubit({required this.transferMoneyCase})
      : super(TransferMoneyState.initial());

  transferMoney({
    required String receiver,
    required String amount,
  }) async {
    emit(TransferMoneyState.loading());
    final response = await transferMoneyCase.transferMoney(
        receiver: receiver, amount: amount);

    if (response.error == null) {
      emit(TransferMoneyState.success(successMessage: response.result!));
    } else {
      emit(
        TransferMoneyState.failed(error: response.error!.message),
      );
    }
  }
}

@freezed
class TransferMoneyState with _$TransferMoneyState {
  const factory TransferMoneyState.initial() = _Initial;
  const factory TransferMoneyState.loading() = _Loading;
  const factory TransferMoneyState.success({required String successMessage}) =
      _Success;
  const factory TransferMoneyState.failed({required String error}) = _Failed;
}
