import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_email_case.dart';
part 'login_email_cubit.freezed.dart';

class LoginEmailCubit extends Cubit<LoginEmailState> {
  final LoginEmailCase loginEmailCase;
  LoginEmailCubit({
    required this.loginEmailCase,
  }) : super(LoginEmailState.initial());

  login({
    required String email,
    required String password,
  }) async {
    emit(LoginEmailState.loading());
    final response =
        await loginEmailCase.loginEmail(email: email, password: password);
    if (response.error == null) {
      emit(LoginEmailState.loginSuccess(token: response.token!));
    } else {
      emit(LoginEmailState.loginFailed(errorMessage: response.error!.message));
    }
  }
}

@freezed
class LoginEmailState with _$LoginEmailState {
  const factory LoginEmailState.initial() = _Initial;
  const factory LoginEmailState.loading() = _LoginLoading;
  const factory LoginEmailState.loginSuccess({required String token}) =
      _LoginSuccess;
  const factory LoginEmailState.loginFailed({required String errorMessage}) =
      _LoginFailed;
}
