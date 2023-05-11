part of 'passwordless_signin_bloc.dart';

@freezed
class PasswordlessSigninEvent with _$PasswordlessSigninEvent {
  const factory PasswordlessSigninEvent.emailChanged(String email) =
      _EmailChanged;
  const factory PasswordlessSigninEvent.sendMagicLink() = _SendMagicLink;
  const factory PasswordlessSigninEvent.openMailApp() = _OpenMailApp;
}
