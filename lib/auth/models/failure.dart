// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.unexpectedError([String? message]) = _UnexpectedError;
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
