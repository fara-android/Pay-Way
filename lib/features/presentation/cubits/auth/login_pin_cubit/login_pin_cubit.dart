import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_pin_case.dart';

part 'login_pin_cubit.freezed.dart';

class LoginPinCubit extends Cubit<LoginPinState> {
  final LoginPinCase usecase;
  LoginPinCubit({required this.usecase}) : super(LoginPinState.initial());

  savePinCode({
    required String pinCode,
    required bool useAutenthication,
  }) {
    final pinSaveResult = usecase.savePinCode(
      pinCode: pinCode,
      useAutenthication: useAutenthication,
    );
    emit(LoginPinState.success());
  }
}

@freezed
class LoginPinState with _$LoginPinState {
  const factory LoginPinState.initial() = _Initial;
  const factory LoginPinState.success() = _Success;
}
