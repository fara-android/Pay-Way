import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/data/data_sources/helpers/catch_exceptions.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';
import 'package:wallet_ui/features/domain/repositories/user/repo_user.dart';
import 'package:wallet_ui/features/domain/usecases/user/user_case.dart';

part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final UserCase userCase;
  UserCubit({required this.userCase}) : super(UserState.initial()) {
    getUser();
  }

  getUser() async {
    emit(UserState.loading());

    final response = await userCase.getUser();

    if (response.error == null) {
      emit(
        UserState.loaded(
          userModel: response.user!,
        ),
      );
    } else {
      emit(UserState.failed(error: response.error!.message));
    }
  }
}

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded({required UserModel userModel}) = _Loaded;
  const factory UserState.failed({required String error}) = _Failed;
}
