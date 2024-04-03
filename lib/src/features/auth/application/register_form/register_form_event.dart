part of 'register_form_bloc.dart';

@freezed
class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory RegisterFormEvent.otpChanged(String otpStr) = OTPChanged;
  const factory RegisterFormEvent.generateOTP() = GenerateOTP;
  const factory RegisterFormEvent.verifyOTP() = VerifyOTP;
  const factory RegisterFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;

  const factory RegisterFormEvent.firstNameChanged(String firstNameStr) =
      FirstNameChanged;
  const factory RegisterFormEvent.lastNameChanged(String lastNameStr) =
      LastNameChanged;
  const factory RegisterFormEvent.roleChanged(String roleStr) = RoleChanged;
  const factory RegisterFormEvent.genderChanged(String genderStr) =
      GenderChanged;
  const factory RegisterFormEvent.phoneNumberChanged(String phoneNumberStr) =
      PhoneNumberChanged;
  const factory RegisterFormEvent.phoneNumberCountryCodeChanged(
      String phoneNumberCountryCodeStr) = PhoneNumberCountryCodeChanged;
  const factory RegisterFormEvent.birthDateChanged(DateTime birthDate) =
      BirthDateChanged;
  const factory RegisterFormEvent.placeOfBirthChanged(String placeOfBirthSTR) =
      PlaceOfBirthChanged;
  const factory RegisterFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory RegisterFormEvent.streetAddressChanged(
      String streetAddressStr) = StreetAddressChanged;
  const factory RegisterFormEvent.streetAddress2Changed(
      String streetAddress2Str) = StreetAddress2Changed;

  const factory RegisterFormEvent.cityChanged(String cityStr) = CityChanged;
  const factory RegisterFormEvent.stateChanged(String stateStr) = StateChanged;
  const factory RegisterFormEvent.zipCodeChanged(String zipCodeStr) =
      ZipCodeChanged;
  const factory RegisterFormEvent.countryChanged(String countryChanged) =
      CountryChanged;
}
