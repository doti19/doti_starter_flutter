import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart' as number;

import '../../domain/auth_failure.dart';
import '../../domain/i_auth_repository.dart';
import '../../domain/value_objects.dart';

part 'register_form_bloc.freezed.dart';
part 'register_form_event.dart';
part 'register_form_state.dart';

@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterFormBloc(this._authRepository) : super(RegisterFormState.initial()) {
    on<RegisterFormEvent>(
      (event, emit) async {
        await event.when(
          emailChanged: (emailStr) => emailChanged(emit, emailStr),
          otpChanged: (otpStr) => otpChanged(emit, otpStr),
          // passwordChanged: (passwordStr) => passwordChanged(emit, passwordStr),
          generateOTP: () => generateOTP(
            emit,
            _authRepository.generateOTP,
          ),
          verifyOTP: () => verifyOTP(
            emit,
            _authRepository.verifyOTP,
          ),
          registerWithEmailAndPasswordPressed: () =>
              registerUsingEmailAndPassword(
            emit,
            _authRepository.registerWithEmailAndPassword,
          ),
          firstNameChanged: (String firstNameStr) {
            emit(state.copyWith(
              firstName: FirstName(firstNameStr),
              authFailureOrSuccessOption: none(),
            ));
          },

          lastNameChanged: (String lastNameStr) {
            emit(state.copyWith(
              lastName: LastName(lastNameStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          passwordChanged: (String passwordStr) {
            emit(state.copyWith(
              password: Password(passwordStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          roleChanged: (String roleStr) {
            print(roleStr);
            emit(state.copyWith(
              role: Role(roleStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          genderChanged: (String genderStr) {
            print(genderStr);
            emit(state.copyWith(
              gender: Gender(genderStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          phoneNumberChanged: (String phoneNumberStr) {
            emit(state.copyWith(
              phoneNumber: PhoneNumber(phoneNumberStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          phoneNumberCountryCodeChanged: (String phoneNumberCountryCodeStr) {
            emit(state.copyWith(
              phoneNumberCountryCode:
                  PhoneNumberCountryCode(phoneNumberCountryCodeStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          birthDateChanged: (DateTime birthDate) {
            emit(state.copyWith(
              birthDate: DateOfBirth(birthDate),
              authFailureOrSuccessOption: none(),
            ));
          },
          placeOfBirthChanged: (String placeOfBirthStr) {
            emit(state.copyWith(
              placeOfBirth: PlaceOfBirth(placeOfBirthStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          streetAddressChanged: (String streetAddressStr) {
            emit(state.copyWith(
              streetAddress: StreetAddress(streetAddressStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          streetAddress2Changed: (String streetAddress2Str) {
            emit(state.copyWith(
              streetAddress2: StreetAddress2(streetAddress2Str),
              authFailureOrSuccessOption: none(),
            ));
          },
          cityChanged: (String cityStr) {
            emit(state.copyWith(
              city: City(cityStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          stateChanged: (String stateStr) {
            emit(state.copyWith(
              state: UserState(stateStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          zipCodeChanged: (String zipCodeStr) {
            emit(state.copyWith(
              zipCode: ZipCode(zipCodeStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          countryChanged: (String countryStr) {
            emit(state.copyWith(
              country: Country(countryStr),
              authFailureOrSuccessOption: none(),
            ));
          },

          // signInWithEmailAndPasswordPressed: () => signInUsingEmailAndPassword(
          //   emit,
          //   _authRepository.signInWithEmailAndPassword,
          // ),
          // status: () async {
          //   await _authRepository.status();
          // },
        );
      },
      transformer: droppable(),
    );
  }

  final IAuthRepository _authRepository;

  Future<void> generateOTP(
    Emitter<RegisterFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
    }) forwardedCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.email.isValid();

    if (isEmailValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        email: state.email,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<void> verifyOTP(
    Emitter<RegisterFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
      required OTP otp,
    }) forwardedCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.email.isValid();
    final isOTPValid = state.otp.isValid();

    if (isEmailValid && isOTPValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        email: state.email,
        otp: state.otp,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<void> registerUsingEmailAndPassword(
      Emitter<RegisterFormState> emit,
      Future<Either<AuthFailure, Unit>> Function(
              {required City city,
              required OTP otp,
              required Country country,
              required DateOfBirth dateOfBirth,
              required PlaceOfBirth placeOfBirth,
              required Email email,
              required Role role,
              required FirstName firstName,
              required Gender gender,
              required LastName lastName,
              required Password password,
              required PhoneNumber phoneNumber,
              required PhoneNumberCountryCode phoneNumberCountryCode,
              required UserState state,
              required StreetAddress streetAddress,
              StreetAddress2? streetAddress2,
              required ZipCode zipCode})
          registerWithEmailAndPassword) async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = state.email.isValid();
    final isOTPValid = state.otp.isValid();
    final isRoleValid = state.role.isValid();
    final isPasswordValid = state.password.isValid();
    final isFirstNameValid = state.firstName.isValid();
    final isLastNameValid = state.lastName.isValid();
    final isPhoneNumberValid = state.phoneNumber.isValid();
    final isPhoneNumberCountryCodeValid =
        state.phoneNumberCountryCode.isValid();
    final isPlaceOfBirthValid = state.placeOfBirth.isValid();
    final isDateOfBirthValid = state.birthDate.isValid();
    final isGenderValid = state.gender.isValid();
    final isStreetAddressValid = state.streetAddress.isValid();
    final isCityValid = state.city.isValid();
    final isStateValid = state.state.isValid();
    final isCountryValid = state.country.isValid();
    final isZipCodeValid = state.zipCode.isValid();
    print(state);

    if (isEmailValid &&
        isOTPValid &&
        isPasswordValid &&
        isRoleValid &&
        isFirstNameValid &&
        isLastNameValid &&
        isPhoneNumberValid &&
        isPhoneNumberCountryCodeValid &&
        isDateOfBirthValid &&
        isPlaceOfBirthValid &&
        isGenderValid &&
        isStreetAddressValid &&
        isCityValid &&
        isStateValid &&
        isCountryValid &&
        isZipCodeValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await registerWithEmailAndPassword(
        email: state.email,
        otp: state.otp,
        password: state.password,
        role: state.role,
        firstName: state.firstName,
        lastName: state.lastName,
        phoneNumber: state.phoneNumber,
        phoneNumberCountryCode: state.phoneNumberCountryCode,
        dateOfBirth: state.birthDate,
        placeOfBirth: state.placeOfBirth,
        gender: state.gender,
        streetAddress: state.streetAddress,
        streetAddress2: state.streetAddress2,
        city: state.city,
        state: state.state,
        country: state.country,
        zipCode: state.zipCode,
      );
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  FutureOr<void> emailChanged(
    Emitter<RegisterFormState> emit,
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

  FutureOr<void> otpChanged(
    Emitter<RegisterFormState> emit,
    String otpStr,
  ) {
    emit(state.copyWith(
      otp: OTP(otpStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  // FutureOr<void> passwordChanged(
  //   Emitter<SignInFormState> emit,
  //   String passwordStr,
  // ) {
  //   emit(state.copyWith(
  //     password: Password(passwordStr),
  //     authFailureOrSuccessOption: none(),
  //   ));
  // }
}
