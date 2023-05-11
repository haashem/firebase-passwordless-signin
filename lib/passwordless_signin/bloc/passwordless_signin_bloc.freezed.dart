// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passwordless_signin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordlessSigninEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendMagicLink,
    required TResult Function() openMailApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? sendMagicLink,
    TResult? Function()? openMailApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendMagicLink,
    TResult Function()? openMailApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SendMagicLink value) sendMagicLink,
    required TResult Function(_OpenMailApp value) openMailApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SendMagicLink value)? sendMagicLink,
    TResult? Function(_OpenMailApp value)? openMailApp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SendMagicLink value)? sendMagicLink,
    TResult Function(_OpenMailApp value)? openMailApp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordlessSigninEventCopyWith<$Res> {
  factory $PasswordlessSigninEventCopyWith(PasswordlessSigninEvent value,
          $Res Function(PasswordlessSigninEvent) then) =
      _$PasswordlessSigninEventCopyWithImpl<$Res, PasswordlessSigninEvent>;
}

/// @nodoc
class _$PasswordlessSigninEventCopyWithImpl<$Res,
        $Val extends PasswordlessSigninEvent>
    implements $PasswordlessSigninEventCopyWith<$Res> {
  _$PasswordlessSigninEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EmailChangedCopyWith<$Res> {
  factory _$$_EmailChangedCopyWith(
          _$_EmailChanged value, $Res Function(_$_EmailChanged) then) =
      __$$_EmailChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_EmailChangedCopyWithImpl<$Res>
    extends _$PasswordlessSigninEventCopyWithImpl<$Res, _$_EmailChanged>
    implements _$$_EmailChangedCopyWith<$Res> {
  __$$_EmailChangedCopyWithImpl(
      _$_EmailChanged _value, $Res Function(_$_EmailChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_EmailChanged(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailChanged implements _EmailChanged {
  const _$_EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordlessSigninEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailChanged &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      __$$_EmailChangedCopyWithImpl<_$_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendMagicLink,
    required TResult Function() openMailApp,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? sendMagicLink,
    TResult? Function()? openMailApp,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendMagicLink,
    TResult Function()? openMailApp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SendMagicLink value) sendMagicLink,
    required TResult Function(_OpenMailApp value) openMailApp,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SendMagicLink value)? sendMagicLink,
    TResult? Function(_OpenMailApp value)? openMailApp,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SendMagicLink value)? sendMagicLink,
    TResult Function(_OpenMailApp value)? openMailApp,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements PasswordlessSigninEvent {
  const factory _EmailChanged(final String email) = _$_EmailChanged;

  String get email;
  @JsonKey(ignore: true)
  _$$_EmailChangedCopyWith<_$_EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendMagicLinkCopyWith<$Res> {
  factory _$$_SendMagicLinkCopyWith(
          _$_SendMagicLink value, $Res Function(_$_SendMagicLink) then) =
      __$$_SendMagicLinkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendMagicLinkCopyWithImpl<$Res>
    extends _$PasswordlessSigninEventCopyWithImpl<$Res, _$_SendMagicLink>
    implements _$$_SendMagicLinkCopyWith<$Res> {
  __$$_SendMagicLinkCopyWithImpl(
      _$_SendMagicLink _value, $Res Function(_$_SendMagicLink) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SendMagicLink implements _SendMagicLink {
  const _$_SendMagicLink();

  @override
  String toString() {
    return 'PasswordlessSigninEvent.sendMagicLink()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SendMagicLink);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendMagicLink,
    required TResult Function() openMailApp,
  }) {
    return sendMagicLink();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? sendMagicLink,
    TResult? Function()? openMailApp,
  }) {
    return sendMagicLink?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendMagicLink,
    TResult Function()? openMailApp,
    required TResult orElse(),
  }) {
    if (sendMagicLink != null) {
      return sendMagicLink();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SendMagicLink value) sendMagicLink,
    required TResult Function(_OpenMailApp value) openMailApp,
  }) {
    return sendMagicLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SendMagicLink value)? sendMagicLink,
    TResult? Function(_OpenMailApp value)? openMailApp,
  }) {
    return sendMagicLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SendMagicLink value)? sendMagicLink,
    TResult Function(_OpenMailApp value)? openMailApp,
    required TResult orElse(),
  }) {
    if (sendMagicLink != null) {
      return sendMagicLink(this);
    }
    return orElse();
  }
}

abstract class _SendMagicLink implements PasswordlessSigninEvent {
  const factory _SendMagicLink() = _$_SendMagicLink;
}

/// @nodoc
abstract class _$$_OpenMailAppCopyWith<$Res> {
  factory _$$_OpenMailAppCopyWith(
          _$_OpenMailApp value, $Res Function(_$_OpenMailApp) then) =
      __$$_OpenMailAppCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OpenMailAppCopyWithImpl<$Res>
    extends _$PasswordlessSigninEventCopyWithImpl<$Res, _$_OpenMailApp>
    implements _$$_OpenMailAppCopyWith<$Res> {
  __$$_OpenMailAppCopyWithImpl(
      _$_OpenMailApp _value, $Res Function(_$_OpenMailApp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OpenMailApp implements _OpenMailApp {
  const _$_OpenMailApp();

  @override
  String toString() {
    return 'PasswordlessSigninEvent.openMailApp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OpenMailApp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() sendMagicLink,
    required TResult Function() openMailApp,
  }) {
    return openMailApp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? sendMagicLink,
    TResult? Function()? openMailApp,
  }) {
    return openMailApp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? sendMagicLink,
    TResult Function()? openMailApp,
    required TResult orElse(),
  }) {
    if (openMailApp != null) {
      return openMailApp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_SendMagicLink value) sendMagicLink,
    required TResult Function(_OpenMailApp value) openMailApp,
  }) {
    return openMailApp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_SendMagicLink value)? sendMagicLink,
    TResult? Function(_OpenMailApp value)? openMailApp,
  }) {
    return openMailApp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_SendMagicLink value)? sendMagicLink,
    TResult Function(_OpenMailApp value)? openMailApp,
    required TResult orElse(),
  }) {
    if (openMailApp != null) {
      return openMailApp(this);
    }
    return orElse();
  }
}

abstract class _OpenMailApp implements PasswordlessSigninEvent {
  const factory _OpenMailApp() = _$_OpenMailApp;
}

/// @nodoc
mixin _$PasswordlessSigninState {
  Option<Either<String, String>> get emailAddress =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<String, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordlessSigninStateCopyWith<PasswordlessSigninState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordlessSigninStateCopyWith<$Res> {
  factory $PasswordlessSigninStateCopyWith(PasswordlessSigninState value,
          $Res Function(PasswordlessSigninState) then) =
      _$PasswordlessSigninStateCopyWithImpl<$Res, PasswordlessSigninState>;
  @useResult
  $Res call(
      {Option<Either<String, String>> emailAddress,
      bool isSubmitting,
      Option<Either<String, Unit>> failureOrSuccessOption});
}

/// @nodoc
class _$PasswordlessSigninStateCopyWithImpl<$Res,
        $Val extends PasswordlessSigninState>
    implements $PasswordlessSigninStateCopyWith<$Res> {
  _$PasswordlessSigninStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, String>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordlessSignInFormStateCopyWith<$Res>
    implements $PasswordlessSigninStateCopyWith<$Res> {
  factory _$$_PasswordlessSignInFormStateCopyWith(
          _$_PasswordlessSignInFormState value,
          $Res Function(_$_PasswordlessSignInFormState) then) =
      __$$_PasswordlessSignInFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<String, String>> emailAddress,
      bool isSubmitting,
      Option<Either<String, Unit>> failureOrSuccessOption});
}

/// @nodoc
class __$$_PasswordlessSignInFormStateCopyWithImpl<$Res>
    extends _$PasswordlessSigninStateCopyWithImpl<$Res,
        _$_PasswordlessSignInFormState>
    implements _$$_PasswordlessSignInFormStateCopyWith<$Res> {
  __$$_PasswordlessSignInFormStateCopyWithImpl(
      _$_PasswordlessSignInFormState _value,
      $Res Function(_$_PasswordlessSignInFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PasswordlessSignInFormState(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, String>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, Unit>>,
    ));
  }
}

/// @nodoc

class _$_PasswordlessSignInFormState implements _PasswordlessSignInFormState {
  const _$_PasswordlessSignInFormState(
      {required this.emailAddress,
      required this.isSubmitting,
      required this.failureOrSuccessOption});

  @override
  final Option<Either<String, String>> emailAddress;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<String, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PasswordlessSigninState(emailAddress: $emailAddress, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordlessSignInFormState &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, emailAddress, isSubmitting, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordlessSignInFormStateCopyWith<_$_PasswordlessSignInFormState>
      get copyWith => __$$_PasswordlessSignInFormStateCopyWithImpl<
          _$_PasswordlessSignInFormState>(this, _$identity);
}

abstract class _PasswordlessSignInFormState implements PasswordlessSigninState {
  const factory _PasswordlessSignInFormState(
          {required final Option<Either<String, String>> emailAddress,
          required final bool isSubmitting,
          required final Option<Either<String, Unit>> failureOrSuccessOption}) =
      _$_PasswordlessSignInFormState;

  @override
  Option<Either<String, String>> get emailAddress;
  @override
  bool get isSubmitting;
  @override
  Option<Either<String, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordlessSignInFormStateCopyWith<_$_PasswordlessSignInFormState>
      get copyWith => throw _privateConstructorUsedError;
}
