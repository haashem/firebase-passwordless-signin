import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';

part 'passwordless_signin_bloc.freezed.dart';
part 'passwordless_signin_event.dart';
part 'passwordless_signin_state.dart';

class PasswordlessSigninBloc
    extends Bloc<PasswordlessSigninEvent, PasswordlessSigninState> {
  final PasswordlessAuthenticator _authenticator;

  PasswordlessSigninBloc(this._authenticator)
      : super(PasswordlessSigninState.initial()) {
    on<PasswordlessSigninEvent>((event, emit) async {
      await event.map(
        emailChanged: (event) async => _emailChanged(event, emit),
        sendMagicLink: (event) async => _sendMagicLink(event, emit),
        openMailApp: (event) async => _openMailApp(event, emit),
      );
    });
  }

  void _emailChanged(
    _EmailChanged event,
    Emitter<PasswordlessSigninState> emit,
  ) {
    emit(
      state.copyWith(
        emailAddress: some(right(event.email)),
        failureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _sendMagicLink(
    _SendMagicLink event,
    Emitter<PasswordlessSigninState> emit,
  ) async {
    final emailValidationResult =
        _validateEmailAddress(state.emailAddress.value ?? '');

    await emailValidationResult.fold(
      (invalidEmail) async => emit(
        state.copyWith(
          emailAddress: some(emailValidationResult),
          isSubmitting: false,
          failureOrSuccessOption: none(),
        ),
      ),
      (validEmail) async {
        emit(
          state.copyWith(isSubmitting: true, failureOrSuccessOption: none()),
        );

        final failureOrSuccess = await _authenticator.sendSignInLinkToEmail(
          validEmail,
        );

        emit(
          state.copyWith(
            isSubmitting: false,
            failureOrSuccessOption: some(
              failureOrSuccess.fold(
                (l) => left(l.message ?? 'Unknown error'),
                (r) => right(r),
              ),
            ),
          ),
        );
      },
    );
  }

  void _openMailApp(
    _OpenMailApp event,
    Emitter<PasswordlessSigninState> emit,
  ) {}

  Either<FailureMessage, String> _validateEmailAddress(String email) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(email)) {
      return right(email);
    } else {
      return left('Enter valid email');
    }
  }
}

extension EitherValueOrFailure on Option<Either<FailureMessage, String>> {
  String? get value => fold(() => null, (r) => r.fold((l) => null, (r) => r));
  String? get validationError => fold(
        () => null,
        (a) => a.fold((validationError) => validationError, (r) => null),
      );
}
