import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

class Failure {
  final String? message;
  Failure.unexpectedError([this.message]);
}

@freezed
class EmailLinkFailure with _$EmailLinkFailure {
  const factory EmailLinkFailure.linkError([String? message]) = _LinkError;
  const factory EmailLinkFailure.isNotSignInWithEmailLink() =
      _IsNotSignInWithEmailLink;
  const factory EmailLinkFailure.emailNotSet() = _EmailNotSet;
  const factory EmailLinkFailure.signInFailed([String? message]) =
      _SignInFailed;
  const factory EmailLinkFailure.userAlreadySignedIn() = _UserAlreadySignedIn;
}
