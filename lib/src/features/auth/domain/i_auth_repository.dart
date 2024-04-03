import 'package:fpdart/fpdart.dart';

import 'auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthRepository {
  Future<bool> isSignedIn();

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
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required Email email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> generateOTP({
    required Email email,
  });

  Future<Either<AuthFailure, Unit>> verifyOTP({
    required Email email,
    required OTP otp,
  });

  Future<Either<AuthFailure, Unit>> forgetPassword({
    required Email email,
  });

  Future<Either<AuthFailure, Unit>> signOut();

  Future<String?> getSignedInCredentials();
}
