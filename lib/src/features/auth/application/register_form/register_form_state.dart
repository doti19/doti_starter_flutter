part of 'register_form_bloc.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required Email email,
    required Role role,
    required OTP otp,
    required Password password,
    required FirstName firstName,
    required LastName lastName,
    required PhoneNumber phoneNumber,
    required PhoneNumberCountryCode phoneNumberCountryCode,
    required PlaceOfBirth placeOfBirth,
    required DateOfBirth birthDate,
    required Gender gender,
    required StreetAddress streetAddress,
    StreetAddress2? streetAddress2,
    required City city,
    required UserState state,
    required Country country,
    required ZipCode zipCode,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        email: Email(''),
        role: Role(''),
        otp: OTP(''),
        password: Password(''),
        firstName: FirstName(''),
        lastName: LastName(''),
        phoneNumber: PhoneNumber(''),
        phoneNumberCountryCode: PhoneNumberCountryCode(''),
        placeOfBirth: PlaceOfBirth(''),
        birthDate: DateOfBirth(
          DateTime.now().subtract(const Duration(days: 80 * 365)),
        ),
        gender: Gender(''),
        streetAddress: StreetAddress(''),
        streetAddress2: StreetAddress2(''),
        city: City(''),
        state: UserState(''),
        country: Country(''),
        zipCode: ZipCode(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
