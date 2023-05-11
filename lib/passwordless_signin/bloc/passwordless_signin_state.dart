part of 'passwordless_signin_bloc.dart';

typedef FailureMessage = String;

@freezed
class PasswordlessSigninState with _$PasswordlessSigninState {
  const factory PasswordlessSigninState({
    required Option<Either<FailureMessage, String>> emailAddress,
    required bool isSubmitting,
    required Option<Either<FailureMessage, Unit>> failureOrSuccessOption,
  }) = _PasswordlessSignInFormState;

  factory PasswordlessSigninState.initial() => PasswordlessSigninState(
        emailAddress: none(),
        isSubmitting: false,
        failureOrSuccessOption: none(),
      );
}
