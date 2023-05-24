// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnexpectedError value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnexpectedErrorCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_UnexpectedErrorCopyWith(
          _$_UnexpectedError value, $Res Function(_$_UnexpectedError) then) =
      __$$_UnexpectedErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_UnexpectedErrorCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_UnexpectedError>
    implements _$$_UnexpectedErrorCopyWith<$Res> {
  __$$_UnexpectedErrorCopyWithImpl(
      _$_UnexpectedError _value, $Res Function(_$_UnexpectedError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_UnexpectedError(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UnexpectedError extends _UnexpectedError {
  const _$_UnexpectedError([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.unexpectedError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnexpectedError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnexpectedErrorCopyWith<_$_UnexpectedError> get copyWith =>
      __$$_UnexpectedErrorCopyWithImpl<_$_UnexpectedError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpectedError,
  }) {
    return unexpectedError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? unexpectedError,
  }) {
    return unexpectedError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnexpectedError value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnexpectedError value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class _UnexpectedError extends Failure {
  const factory _UnexpectedError([final String? message]) = _$_UnexpectedError;
  const _UnexpectedError._() : super._();

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_UnexpectedErrorCopyWith<_$_UnexpectedError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmailLinkFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) linkError,
    required TResult Function() isNotSignInWithEmailLink,
    required TResult Function() emailNotSet,
    required TResult Function(String? message) signInFailed,
    required TResult Function() userAlreadySignedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? linkError,
    TResult? Function()? isNotSignInWithEmailLink,
    TResult? Function()? emailNotSet,
    TResult? Function(String? message)? signInFailed,
    TResult? Function()? userAlreadySignedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? linkError,
    TResult Function()? isNotSignInWithEmailLink,
    TResult Function()? emailNotSet,
    TResult Function(String? message)? signInFailed,
    TResult Function()? userAlreadySignedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkError value) linkError,
    required TResult Function(_IsNotSignInWithEmailLink value)
        isNotSignInWithEmailLink,
    required TResult Function(_EmailNotSet value) emailNotSet,
    required TResult Function(_SignInFailed value) signInFailed,
    required TResult Function(_UserAlreadySignedIn value) userAlreadySignedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LinkError value)? linkError,
    TResult? Function(_IsNotSignInWithEmailLink value)?
        isNotSignInWithEmailLink,
    TResult? Function(_EmailNotSet value)? emailNotSet,
    TResult? Function(_SignInFailed value)? signInFailed,
    TResult? Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkError value)? linkError,
    TResult Function(_IsNotSignInWithEmailLink value)? isNotSignInWithEmailLink,
    TResult Function(_EmailNotSet value)? emailNotSet,
    TResult Function(_SignInFailed value)? signInFailed,
    TResult Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailLinkFailureCopyWith<$Res> {
  factory $EmailLinkFailureCopyWith(
          EmailLinkFailure value, $Res Function(EmailLinkFailure) then) =
      _$EmailLinkFailureCopyWithImpl<$Res, EmailLinkFailure>;
}

/// @nodoc
class _$EmailLinkFailureCopyWithImpl<$Res, $Val extends EmailLinkFailure>
    implements $EmailLinkFailureCopyWith<$Res> {
  _$EmailLinkFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LinkErrorCopyWith<$Res> {
  factory _$$_LinkErrorCopyWith(
          _$_LinkError value, $Res Function(_$_LinkError) then) =
      __$$_LinkErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_LinkErrorCopyWithImpl<$Res>
    extends _$EmailLinkFailureCopyWithImpl<$Res, _$_LinkError>
    implements _$$_LinkErrorCopyWith<$Res> {
  __$$_LinkErrorCopyWithImpl(
      _$_LinkError _value, $Res Function(_$_LinkError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_LinkError(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LinkError implements _LinkError {
  const _$_LinkError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'EmailLinkFailure.linkError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinkErrorCopyWith<_$_LinkError> get copyWith =>
      __$$_LinkErrorCopyWithImpl<_$_LinkError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) linkError,
    required TResult Function() isNotSignInWithEmailLink,
    required TResult Function() emailNotSet,
    required TResult Function(String? message) signInFailed,
    required TResult Function() userAlreadySignedIn,
  }) {
    return linkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? linkError,
    TResult? Function()? isNotSignInWithEmailLink,
    TResult? Function()? emailNotSet,
    TResult? Function(String? message)? signInFailed,
    TResult? Function()? userAlreadySignedIn,
  }) {
    return linkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? linkError,
    TResult Function()? isNotSignInWithEmailLink,
    TResult Function()? emailNotSet,
    TResult Function(String? message)? signInFailed,
    TResult Function()? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (linkError != null) {
      return linkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkError value) linkError,
    required TResult Function(_IsNotSignInWithEmailLink value)
        isNotSignInWithEmailLink,
    required TResult Function(_EmailNotSet value) emailNotSet,
    required TResult Function(_SignInFailed value) signInFailed,
    required TResult Function(_UserAlreadySignedIn value) userAlreadySignedIn,
  }) {
    return linkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LinkError value)? linkError,
    TResult? Function(_IsNotSignInWithEmailLink value)?
        isNotSignInWithEmailLink,
    TResult? Function(_EmailNotSet value)? emailNotSet,
    TResult? Function(_SignInFailed value)? signInFailed,
    TResult? Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
  }) {
    return linkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkError value)? linkError,
    TResult Function(_IsNotSignInWithEmailLink value)? isNotSignInWithEmailLink,
    TResult Function(_EmailNotSet value)? emailNotSet,
    TResult Function(_SignInFailed value)? signInFailed,
    TResult Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (linkError != null) {
      return linkError(this);
    }
    return orElse();
  }
}

abstract class _LinkError implements EmailLinkFailure {
  const factory _LinkError([final String? message]) = _$_LinkError;

  String? get message;
  @JsonKey(ignore: true)
  _$$_LinkErrorCopyWith<_$_LinkError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_IsNotSignInWithEmailLinkCopyWith<$Res> {
  factory _$$_IsNotSignInWithEmailLinkCopyWith(
          _$_IsNotSignInWithEmailLink value,
          $Res Function(_$_IsNotSignInWithEmailLink) then) =
      __$$_IsNotSignInWithEmailLinkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IsNotSignInWithEmailLinkCopyWithImpl<$Res>
    extends _$EmailLinkFailureCopyWithImpl<$Res, _$_IsNotSignInWithEmailLink>
    implements _$$_IsNotSignInWithEmailLinkCopyWith<$Res> {
  __$$_IsNotSignInWithEmailLinkCopyWithImpl(_$_IsNotSignInWithEmailLink _value,
      $Res Function(_$_IsNotSignInWithEmailLink) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_IsNotSignInWithEmailLink implements _IsNotSignInWithEmailLink {
  const _$_IsNotSignInWithEmailLink();

  @override
  String toString() {
    return 'EmailLinkFailure.isNotSignInWithEmailLink()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IsNotSignInWithEmailLink);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) linkError,
    required TResult Function() isNotSignInWithEmailLink,
    required TResult Function() emailNotSet,
    required TResult Function(String? message) signInFailed,
    required TResult Function() userAlreadySignedIn,
  }) {
    return isNotSignInWithEmailLink();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? linkError,
    TResult? Function()? isNotSignInWithEmailLink,
    TResult? Function()? emailNotSet,
    TResult? Function(String? message)? signInFailed,
    TResult? Function()? userAlreadySignedIn,
  }) {
    return isNotSignInWithEmailLink?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? linkError,
    TResult Function()? isNotSignInWithEmailLink,
    TResult Function()? emailNotSet,
    TResult Function(String? message)? signInFailed,
    TResult Function()? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (isNotSignInWithEmailLink != null) {
      return isNotSignInWithEmailLink();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkError value) linkError,
    required TResult Function(_IsNotSignInWithEmailLink value)
        isNotSignInWithEmailLink,
    required TResult Function(_EmailNotSet value) emailNotSet,
    required TResult Function(_SignInFailed value) signInFailed,
    required TResult Function(_UserAlreadySignedIn value) userAlreadySignedIn,
  }) {
    return isNotSignInWithEmailLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LinkError value)? linkError,
    TResult? Function(_IsNotSignInWithEmailLink value)?
        isNotSignInWithEmailLink,
    TResult? Function(_EmailNotSet value)? emailNotSet,
    TResult? Function(_SignInFailed value)? signInFailed,
    TResult? Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
  }) {
    return isNotSignInWithEmailLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkError value)? linkError,
    TResult Function(_IsNotSignInWithEmailLink value)? isNotSignInWithEmailLink,
    TResult Function(_EmailNotSet value)? emailNotSet,
    TResult Function(_SignInFailed value)? signInFailed,
    TResult Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (isNotSignInWithEmailLink != null) {
      return isNotSignInWithEmailLink(this);
    }
    return orElse();
  }
}

abstract class _IsNotSignInWithEmailLink implements EmailLinkFailure {
  const factory _IsNotSignInWithEmailLink() = _$_IsNotSignInWithEmailLink;
}

/// @nodoc
abstract class _$$_EmailNotSetCopyWith<$Res> {
  factory _$$_EmailNotSetCopyWith(
          _$_EmailNotSet value, $Res Function(_$_EmailNotSet) then) =
      __$$_EmailNotSetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmailNotSetCopyWithImpl<$Res>
    extends _$EmailLinkFailureCopyWithImpl<$Res, _$_EmailNotSet>
    implements _$$_EmailNotSetCopyWith<$Res> {
  __$$_EmailNotSetCopyWithImpl(
      _$_EmailNotSet _value, $Res Function(_$_EmailNotSet) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EmailNotSet implements _EmailNotSet {
  const _$_EmailNotSet();

  @override
  String toString() {
    return 'EmailLinkFailure.emailNotSet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmailNotSet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) linkError,
    required TResult Function() isNotSignInWithEmailLink,
    required TResult Function() emailNotSet,
    required TResult Function(String? message) signInFailed,
    required TResult Function() userAlreadySignedIn,
  }) {
    return emailNotSet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? linkError,
    TResult? Function()? isNotSignInWithEmailLink,
    TResult? Function()? emailNotSet,
    TResult? Function(String? message)? signInFailed,
    TResult? Function()? userAlreadySignedIn,
  }) {
    return emailNotSet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? linkError,
    TResult Function()? isNotSignInWithEmailLink,
    TResult Function()? emailNotSet,
    TResult Function(String? message)? signInFailed,
    TResult Function()? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (emailNotSet != null) {
      return emailNotSet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkError value) linkError,
    required TResult Function(_IsNotSignInWithEmailLink value)
        isNotSignInWithEmailLink,
    required TResult Function(_EmailNotSet value) emailNotSet,
    required TResult Function(_SignInFailed value) signInFailed,
    required TResult Function(_UserAlreadySignedIn value) userAlreadySignedIn,
  }) {
    return emailNotSet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LinkError value)? linkError,
    TResult? Function(_IsNotSignInWithEmailLink value)?
        isNotSignInWithEmailLink,
    TResult? Function(_EmailNotSet value)? emailNotSet,
    TResult? Function(_SignInFailed value)? signInFailed,
    TResult? Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
  }) {
    return emailNotSet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkError value)? linkError,
    TResult Function(_IsNotSignInWithEmailLink value)? isNotSignInWithEmailLink,
    TResult Function(_EmailNotSet value)? emailNotSet,
    TResult Function(_SignInFailed value)? signInFailed,
    TResult Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (emailNotSet != null) {
      return emailNotSet(this);
    }
    return orElse();
  }
}

abstract class _EmailNotSet implements EmailLinkFailure {
  const factory _EmailNotSet() = _$_EmailNotSet;
}

/// @nodoc
abstract class _$$_SignInFailedCopyWith<$Res> {
  factory _$$_SignInFailedCopyWith(
          _$_SignInFailed value, $Res Function(_$_SignInFailed) then) =
      __$$_SignInFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_SignInFailedCopyWithImpl<$Res>
    extends _$EmailLinkFailureCopyWithImpl<$Res, _$_SignInFailed>
    implements _$$_SignInFailedCopyWith<$Res> {
  __$$_SignInFailedCopyWithImpl(
      _$_SignInFailed _value, $Res Function(_$_SignInFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_SignInFailed(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignInFailed implements _SignInFailed {
  const _$_SignInFailed([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'EmailLinkFailure.signInFailed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFailed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInFailedCopyWith<_$_SignInFailed> get copyWith =>
      __$$_SignInFailedCopyWithImpl<_$_SignInFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) linkError,
    required TResult Function() isNotSignInWithEmailLink,
    required TResult Function() emailNotSet,
    required TResult Function(String? message) signInFailed,
    required TResult Function() userAlreadySignedIn,
  }) {
    return signInFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? linkError,
    TResult? Function()? isNotSignInWithEmailLink,
    TResult? Function()? emailNotSet,
    TResult? Function(String? message)? signInFailed,
    TResult? Function()? userAlreadySignedIn,
  }) {
    return signInFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? linkError,
    TResult Function()? isNotSignInWithEmailLink,
    TResult Function()? emailNotSet,
    TResult Function(String? message)? signInFailed,
    TResult Function()? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (signInFailed != null) {
      return signInFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkError value) linkError,
    required TResult Function(_IsNotSignInWithEmailLink value)
        isNotSignInWithEmailLink,
    required TResult Function(_EmailNotSet value) emailNotSet,
    required TResult Function(_SignInFailed value) signInFailed,
    required TResult Function(_UserAlreadySignedIn value) userAlreadySignedIn,
  }) {
    return signInFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LinkError value)? linkError,
    TResult? Function(_IsNotSignInWithEmailLink value)?
        isNotSignInWithEmailLink,
    TResult? Function(_EmailNotSet value)? emailNotSet,
    TResult? Function(_SignInFailed value)? signInFailed,
    TResult? Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
  }) {
    return signInFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkError value)? linkError,
    TResult Function(_IsNotSignInWithEmailLink value)? isNotSignInWithEmailLink,
    TResult Function(_EmailNotSet value)? emailNotSet,
    TResult Function(_SignInFailed value)? signInFailed,
    TResult Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (signInFailed != null) {
      return signInFailed(this);
    }
    return orElse();
  }
}

abstract class _SignInFailed implements EmailLinkFailure {
  const factory _SignInFailed([final String? message]) = _$_SignInFailed;

  String? get message;
  @JsonKey(ignore: true)
  _$$_SignInFailedCopyWith<_$_SignInFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserAlreadySignedInCopyWith<$Res> {
  factory _$$_UserAlreadySignedInCopyWith(_$_UserAlreadySignedIn value,
          $Res Function(_$_UserAlreadySignedIn) then) =
      __$$_UserAlreadySignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserAlreadySignedInCopyWithImpl<$Res>
    extends _$EmailLinkFailureCopyWithImpl<$Res, _$_UserAlreadySignedIn>
    implements _$$_UserAlreadySignedInCopyWith<$Res> {
  __$$_UserAlreadySignedInCopyWithImpl(_$_UserAlreadySignedIn _value,
      $Res Function(_$_UserAlreadySignedIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserAlreadySignedIn implements _UserAlreadySignedIn {
  const _$_UserAlreadySignedIn();

  @override
  String toString() {
    return 'EmailLinkFailure.userAlreadySignedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserAlreadySignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) linkError,
    required TResult Function() isNotSignInWithEmailLink,
    required TResult Function() emailNotSet,
    required TResult Function(String? message) signInFailed,
    required TResult Function() userAlreadySignedIn,
  }) {
    return userAlreadySignedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? linkError,
    TResult? Function()? isNotSignInWithEmailLink,
    TResult? Function()? emailNotSet,
    TResult? Function(String? message)? signInFailed,
    TResult? Function()? userAlreadySignedIn,
  }) {
    return userAlreadySignedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? linkError,
    TResult Function()? isNotSignInWithEmailLink,
    TResult Function()? emailNotSet,
    TResult Function(String? message)? signInFailed,
    TResult Function()? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (userAlreadySignedIn != null) {
      return userAlreadySignedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LinkError value) linkError,
    required TResult Function(_IsNotSignInWithEmailLink value)
        isNotSignInWithEmailLink,
    required TResult Function(_EmailNotSet value) emailNotSet,
    required TResult Function(_SignInFailed value) signInFailed,
    required TResult Function(_UserAlreadySignedIn value) userAlreadySignedIn,
  }) {
    return userAlreadySignedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LinkError value)? linkError,
    TResult? Function(_IsNotSignInWithEmailLink value)?
        isNotSignInWithEmailLink,
    TResult? Function(_EmailNotSet value)? emailNotSet,
    TResult? Function(_SignInFailed value)? signInFailed,
    TResult? Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
  }) {
    return userAlreadySignedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LinkError value)? linkError,
    TResult Function(_IsNotSignInWithEmailLink value)? isNotSignInWithEmailLink,
    TResult Function(_EmailNotSet value)? emailNotSet,
    TResult Function(_SignInFailed value)? signInFailed,
    TResult Function(_UserAlreadySignedIn value)? userAlreadySignedIn,
    required TResult orElse(),
  }) {
    if (userAlreadySignedIn != null) {
      return userAlreadySignedIn(this);
    }
    return orElse();
  }
}

abstract class _UserAlreadySignedIn implements EmailLinkFailure {
  const factory _UserAlreadySignedIn() = _$_UserAlreadySignedIn;
}
