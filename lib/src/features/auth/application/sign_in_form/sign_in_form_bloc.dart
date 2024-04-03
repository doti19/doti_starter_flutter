import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth_failure.dart';
import '../../domain/i_auth_repository.dart';
import '../../domain/value_objects.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<SignInFormEvent>(
      (event, emit) async {
        await event.when(
          emailChanged: (emailStr) => emailChanged(emit, emailStr),
          passwordChanged: (passwordStr) => passwordChanged(emit, passwordStr),
          // registerWithEmailAndPasswordPressed: () =>
          //     registerUsingEmailAndPassword(
          //   emit,
          //   _authRepository.registerWithEmailAndPassword,
          // ),
          signInWithEmailAndPasswordPressed: () => signInUsingEmailAndPassword(
            emit,
            _authRepository.signInWithEmailAndPassword,
          ),
          forgetPassword: () =>
              forgetPassword(emit, _authRepository.forgetPassword),
          // status: () async {
          //   await _authRepository.status();
          // },
        );
      },
      transformer: droppable(),
    );
  }

  final IAuthRepository _authRepository;

  Future<void> forgetPassword(
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
    }) forwardedCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await forwardedCall(
      email: state.email,
    );

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  FutureOr<void> emailChanged(
    Emitter<SignInFormState> emit,
    String emailStr,
  ) {
    // Either<AuthFailure, Unit>? failureOrSuccess;
    // if (!state.email.isValid()) {
    //   emit(state.copyWith(
    //     isSubmitting: false,
    //     showErrorMessages: true,
    //     authFailureOrSuccessOption: optionOf(failureOrSuccess),
    //   ));
    // }
    emit(state.copyWith(
      email: Email(emailStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  FutureOr<void> passwordChanged(
    Emitter<SignInFormState> emit,
    String passwordStr,
  ) {
    emit(state.copyWith(
      password: Password(passwordStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  Future<void> signInUsingEmailAndPassword(
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
      required Password password,
    }) forwardedCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.email.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        email: state.email,
        password: state.password,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  // Future<void> registerUsingEmailAndPassword(
  //     Emitter<SignInFormState> emit,
  //     Future<Either<AuthFailure, Unit>> Function(
  //             {required City city,
  //             required Country country,
  //             required DateOfBirth dateOfBirth,
  //             required Email email,
  //             required Role role,
  //             required FirstName firstName,
  //             required Gender gender,
  //             required LastName lastName,
  //             required Password password,
  //             required PhoneNumber phoneNumber,
  //             required PhoneNumberCountryCode phoneNumberCountryCode,
  //             required UserState state,
  //             required StreetAddress streetAddress,
  //             StreetAddress2? streetAddress2,
  //             required ZipCode zipCode})
  //         registerWithEmailAndPassword) async {
  //   Either<AuthFailure, Unit>? failureOrSuccess;

  //   final isEmailValid = state.email.isValid();
  //   final isRoleValid = state.role.isValid();
  //   final isPasswordValid = state.password.isValid();
  //   final isFirstNameValid = state.firstName.isValid();
  //   final isLastNameValid = state.lastName.isValid();
  //   final isPhoneNumberValid = state.phoneNumber.isValid();
  //   final isPhoneNumberCountryCodeValid =
  //       state.phoneNumberCountryCode.isValid();
  //   final isDateOfBirthValid = state.dateOfBirth.isValid();
  //   final isGenderValid = state.gender.isValid();
  //   final isStreetAddressValid = state.streetAddress.isValid();
  //   final isCityValid = state.city.isValid();
  //   final isStateValid = state.state.isValid();
  //   final isCountryValid = state.country.isValid();
  //   final isZipCodeValid = state.zipCode.isValid();

  //   if (isEmailValid &&
  //       isPasswordValid &&
  //       isRoleValid &&
  //       isFirstNameValid &&
  //       isLastNameValid &&
  //       isPhoneNumberValid &&
  //       isPhoneNumberCountryCodeValid &&
  //       isDateOfBirthValid &&
  //       isGenderValid &&
  //       isStreetAddressValid &&
  //       isCityValid &&
  //       isStateValid &&
  //       isCountryValid &&
  //       isZipCodeValid) {
  //     emit(state.copyWith(
  //       isSubmitting: true,
  //       authFailureOrSuccessOption: none(),
  //     ));

  //     failureOrSuccess = await registerWithEmailAndPassword(
  //       email: state.email,
  //       password: state.password,
  //       role: state.role,
  //       firstName: state.firstName,
  //       lastName: state.lastName,
  //       phoneNumber: state.phoneNumber,
  //       phoneNumberCountryCode: state.phoneNumberCountryCode,
  //       dateOfBirth: state.dateOfBirth,
  //       gender: state.gender,
  //       streetAddress: state.streetAddress,
  //       streetAddress2: state.streetAddress2,
  //       city: state.city,
  //       state: state.state,
  //       country: state.country,
  //       zipCode: state.zipCode,
  //     );
  //   }

  //   emit(state.copyWith(
  //     isSubmitting: false,
  //     showErrorMessages: true,
  //     authFailureOrSuccessOption: optionOf(failureOrSuccess),
  //   ));
  // }
}
