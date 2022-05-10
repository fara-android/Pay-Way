// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_email_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginEmailStateTearOff {
  const _$LoginEmailStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoginLoading loading() {
    return const _LoginLoading();
  }

  _LoginSuccess loginSuccess({required String token}) {
    return _LoginSuccess(
      token: token,
    );
  }

  _LoginFailed loginFailed({required String errorMessage}) {
    return _LoginFailed(
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
const $LoginEmailState = _$LoginEmailStateTearOff();

/// @nodoc
mixin _$LoginEmailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loginSuccess,
    required TResult Function(String errorMessage) loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginLoading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEmailStateCopyWith<$Res> {
  factory $LoginEmailStateCopyWith(
          LoginEmailState value, $Res Function(LoginEmailState) then) =
      _$LoginEmailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginEmailStateCopyWithImpl<$Res>
    implements $LoginEmailStateCopyWith<$Res> {
  _$LoginEmailStateCopyWithImpl(this._value, this._then);

  final LoginEmailState _value;
  // ignore: unused_field
  final $Res Function(LoginEmailState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$LoginEmailStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'LoginEmailState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loginSuccess,
    required TResult Function(String errorMessage) loginFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginLoading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginEmailState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoginLoadingCopyWith<$Res> {
  factory _$LoginLoadingCopyWith(
          _LoginLoading value, $Res Function(_LoginLoading) then) =
      __$LoginLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoginLoadingCopyWithImpl<$Res>
    extends _$LoginEmailStateCopyWithImpl<$Res>
    implements _$LoginLoadingCopyWith<$Res> {
  __$LoginLoadingCopyWithImpl(
      _LoginLoading _value, $Res Function(_LoginLoading) _then)
      : super(_value, (v) => _then(v as _LoginLoading));

  @override
  _LoginLoading get _value => super._value as _LoginLoading;
}

/// @nodoc

class _$_LoginLoading implements _LoginLoading {
  const _$_LoginLoading();

  @override
  String toString() {
    return 'LoginEmailState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoginLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loginSuccess,
    required TResult Function(String errorMessage) loginFailed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginLoading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoginLoading implements LoginEmailState {
  const factory _LoginLoading() = _$_LoginLoading;
}

/// @nodoc
abstract class _$LoginSuccessCopyWith<$Res> {
  factory _$LoginSuccessCopyWith(
          _LoginSuccess value, $Res Function(_LoginSuccess) then) =
      __$LoginSuccessCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class __$LoginSuccessCopyWithImpl<$Res>
    extends _$LoginEmailStateCopyWithImpl<$Res>
    implements _$LoginSuccessCopyWith<$Res> {
  __$LoginSuccessCopyWithImpl(
      _LoginSuccess _value, $Res Function(_LoginSuccess) _then)
      : super(_value, (v) => _then(v as _LoginSuccess));

  @override
  _LoginSuccess get _value => super._value as _LoginSuccess;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_LoginSuccess(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginSuccess implements _LoginSuccess {
  const _$_LoginSuccess({required this.token});

  @override
  final String token;

  @override
  String toString() {
    return 'LoginEmailState.loginSuccess(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginSuccess &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$LoginSuccessCopyWith<_LoginSuccess> get copyWith =>
      __$LoginSuccessCopyWithImpl<_LoginSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loginSuccess,
    required TResult Function(String errorMessage) loginFailed,
  }) {
    return loginSuccess(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
  }) {
    return loginSuccess?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginLoading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccess implements LoginEmailState {
  const factory _LoginSuccess({required String token}) = _$_LoginSuccess;

  String get token => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoginSuccessCopyWith<_LoginSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoginFailedCopyWith<$Res> {
  factory _$LoginFailedCopyWith(
          _LoginFailed value, $Res Function(_LoginFailed) then) =
      __$LoginFailedCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$LoginFailedCopyWithImpl<$Res>
    extends _$LoginEmailStateCopyWithImpl<$Res>
    implements _$LoginFailedCopyWith<$Res> {
  __$LoginFailedCopyWithImpl(
      _LoginFailed _value, $Res Function(_LoginFailed) _then)
      : super(_value, (v) => _then(v as _LoginFailed));

  @override
  _LoginFailed get _value => super._value as _LoginFailed;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_LoginFailed(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginFailed implements _LoginFailed {
  const _$_LoginFailed({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'LoginEmailState.loginFailed(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginFailed &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$LoginFailedCopyWith<_LoginFailed> get copyWith =>
      __$LoginFailedCopyWithImpl<_LoginFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loginSuccess,
    required TResult Function(String errorMessage) loginFailed,
  }) {
    return loginFailed(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
  }) {
    return loginFailed?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loginSuccess,
    TResult Function(String errorMessage)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoginLoading value) loading,
    required TResult Function(_LoginSuccess value) loginSuccess,
    required TResult Function(_LoginFailed value) loginFailed,
  }) {
    return loginFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
  }) {
    return loginFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoginLoading value)? loading,
    TResult Function(_LoginSuccess value)? loginSuccess,
    TResult Function(_LoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed(this);
    }
    return orElse();
  }
}

abstract class _LoginFailed implements LoginEmailState {
  const factory _LoginFailed({required String errorMessage}) = _$_LoginFailed;

  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoginFailedCopyWith<_LoginFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
