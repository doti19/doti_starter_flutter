import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/infrastructure/exceptions.dart';
import '../domain/auth_failure.dart';
import '../domain/i_auth_repository.dart';
import '../domain/value_objects.dart';
import 'auth_remote_service.dart';
import 'credentials_storage/credentials_storage.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(
    this._credentialsStorage,
    this._remoteService,
  );

  final CredentialsStorage _credentialsStorage;
  final IAuthRemoteService _remoteService;

  @override
  Future<bool> isSignedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _remoteService.signOut();
    } on RestApiException catch (e) {
      return left(AuthFailure.server(errorCode: e.errorCode));
    } on NoConnectionException {
      // Ignoring
    }

    return _clearCredentialsStorage();
  }

  @override
  Future<Either<AuthFailure, Unit>> generateOTP({required Email email}) async {
    try {
      final emailStr = email.getOrCrash();
      final authResponse = await _remoteService.generateOTP(email: emailStr);

      return authResponse.when(
        success: () => right(unit),
        withToken: (_) => left(const AuthFailure.userError()),
        withData: (_) => left(const AuthFailure.userError()),
        noConnection: () => left(const AuthFailure.noConnection()),
        failure: (errorCode, message) => left(AuthFailure.server(
          errorCode: errorCode,
          message: message,
        )),
      );
    } on RestApiException catch (e) {
      return left(AuthFailure.server(
        errorCode: e.errorCode,
      ));
    } on NoConnectionException {
      return left(const AuthFailure.noConnection());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyOTP({
    required Email email,
    required OTP otp,
  }) async {
    try {
      final emailStr = email.getOrCrash();
      final otpStr = otp.getOrCrash();

      final authResponse = await _remoteService.verifyOTP(
        email: emailStr,
        otp: otpStr,
      );

      return authResponse.when(
        success: () => right(unit),
        withToken: (_) => left(const AuthFailure.userError()),
        withData: (_) => left(const AuthFailure.userError()),
        noConnection: () => left(const AuthFailure.noConnection()),
        failure: (errorCode, message) => left(AuthFailure.server(
          errorCode: errorCode,
          message: message,
        )),
      );
    } on RestApiException catch (e) {
      return left(AuthFailure.server(
        errorCode: e.errorCode,
      ));
    } on NoConnectionException {
      return left(const AuthFailure.noConnection());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required Email email,
    required Role role,
    required OTP otp,
    required Password password,
    required FirstName firstName,
    required LastName lastName,
    required PhoneNumber phoneNumber,
    required PhoneNumberCountryCode phoneNumberCountryCode,
    required DateOfBirth dateOfBirth,
    required PlaceOfBirth placeOfBirth,
    required Gender gender,
    required StreetAddress streetAddress,
    StreetAddress2? streetAddress2,
    required City city,
    required UserState state,
    required Country country,
    required ZipCode zipCode,
  }) async {
    try {
      final emailStr = email.getOrCrash();
      final passwordStr = password.getOrCrash();
      final otpStr = otp.getOrCrash();
      final roleStr = role.getOrCrash();
      final placeOfBirthStr = placeOfBirth.getOrCrash();
      final firstNameStr = firstName.getOrCrash();
      final lastNameStr = lastName.getOrCrash();
      final phoneNumberStr = phoneNumber.getOrCrash();
      final phoneNumberCountryCodeStr = phoneNumberCountryCode.getOrCrash();
      final dateOfBirthStr = dateOfBirth.getOrCrash();
      final genderStr = gender.getOrCrash();
      final streetAddressStr = streetAddress.getOrCrash();
      final streetAddress2Str = streetAddress2?.getOrCrash() ?? '';
      final cityStr = city.getOrCrash();
      final stateStr = state.getOrCrash();
      final countryStr = country.getOrCrash();
      final zipCodeStr = zipCode.getOrCrash();

      final authResponse = await _remoteService.register(
        email: emailStr,
        password: passwordStr,
        otp: otpStr,
        role: roleStr,
        placeOfBirth: placeOfBirthStr,
        firstName: firstNameStr,
        lastName: lastNameStr,
        phoneNumber: phoneNumberStr,
        phoneNumberCountryCode: phoneNumberCountryCodeStr,
        dateOfBirth: dateOfBirthStr,
        gender: genderStr,
        streetAddress: streetAddressStr,
        streetAddress2: streetAddress2Str,
        city: cityStr,
        state: stateStr,
        country: countryStr,
        zipCode: zipCodeStr,
      );

      return authResponse.when(
        withToken: (_) => left(const AuthFailure.userError()),
        success: () => right(unit),
        withData: (data) => right(unit),
        noConnection: () => left(const AuthFailure.noConnection()),
        failure: (errorCode, message) => left(AuthFailure.server(
          errorCode: errorCode,
          message: message,
        )),
      );
    } on RestApiException catch (e) {
      return left(AuthFailure.server(
        errorCode: e.errorCode,
      ));
    } on NoConnectionException {
      return left(const AuthFailure.noConnection());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required Email email,
    required Password password,
  }) async {
    try {
      final emailStr = email.getOrCrash();
      final passwordStr = password.getOrCrash();

      final authResponse = await _remoteService.signIn(
        email: emailStr,
        password: passwordStr,
      );

      return authResponse.when(
        withToken: (token) async {
          await _credentialsStorage.save(token);
          return right(unit);
        },
        success: () => left(const AuthFailure.userError()),
        withData: (_) => left(const AuthFailure.userError()),
        noConnection: () => left(const AuthFailure.noConnection()),
        failure: (errorCode, message) => left(AuthFailure.server(
          errorCode: errorCode,
          message: message,
        )),
      );
    } on RestApiException catch (e) {
      return left(AuthFailure.server(
        errorCode: e.errorCode,
      ));
    } on NoConnectionException {
      return left(const AuthFailure.noConnection());
    }
  }

  @override
  Future<String?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<Either<AuthFailure, Unit>> _clearCredentialsStorage() async {
    try {
      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> forgetPassword(
      {required Email email}) async {
    try {
      final emailStr = email.getOrCrash();

      final authResponse = await _remoteService.forgetPassword(email: emailStr);

      return authResponse.when(
        success: () => right(unit),
        withToken: (_) => left(const AuthFailure.userError()),
        withData: (_) => left(const AuthFailure.userError()),
        noConnection: () => left(const AuthFailure.noConnection()),
        failure: (errorCode, message) => left(AuthFailure.server(
          errorCode: errorCode,
          message: message,
        )),
      );
    } on RestApiException catch (e) {
      return left(AuthFailure.server(
        errorCode: e.errorCode,
      ));
    } on NoConnectionException {
      return left(const AuthFailure.noConnection());
    }
  }
}
