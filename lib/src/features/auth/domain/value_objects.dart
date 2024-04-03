import 'package:fpdart/fpdart.dart';

import '../../core/domain/failures.dart';
import '../../core/domain/value_objects.dart';
import '../../core/domain/value_validators.dart';

class Email extends ValueObject<String> {
  factory Email(String input) {
    return Email._(
      validateEmail(input),
    );
  }

  const Email._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class OTP extends ValueObject<String> {
  factory OTP(String input) {
    return OTP._(
      validateOTP(input),
    );
  }

  const OTP._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class UserToken extends ValueObject<String> {
  factory UserToken(String input) {
    return UserToken._(
      validateStringNotEmpty(input),
    );
  }

  const UserToken._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class PhoneNumber extends ValueObject<String> {
  factory PhoneNumber(String input) {
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class PhoneNumberCountryCode extends ValueObject<String> {
  factory PhoneNumberCountryCode(String input) {
    return PhoneNumberCountryCode._(
      validatePhoneNumberCountryCode(input),
    );
  }

  const PhoneNumberCountryCode._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class FirstName extends ValueObject<String> {
  factory FirstName(String input) {
    return FirstName._(
      validateName(input),
    );
  }

  const FirstName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class LastName extends ValueObject<String> {
  factory LastName(String input) {
    return LastName._(
      validateName(input),
    );
  }

  const LastName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class PlaceOfBirth extends ValueObject<String> {
  factory PlaceOfBirth(String input) {
    return PlaceOfBirth._(validatePlaceOfBirth(input));
  }

  const PlaceOfBirth._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class DateOfBirth extends ValueObject<String> {
  factory DateOfBirth(DateTime input) {
    return DateOfBirth._(
      validateDateOfBirth(input.toString().split(' ')[0]),
    );
  }

  const DateOfBirth._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Gender extends ValueObject<String> {
  factory Gender(String input) {
    return Gender._(validateGender(input));
  }

  const Gender._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Role extends ValueObject<String> {
  factory Role(String input) {
    return Role._(validateRole(input));
  }

  const Role._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class StreetAddress extends ValueObject<String> {
  factory StreetAddress(String input) {
    return StreetAddress._(validateStringNotEmpty(input));
  }

  const StreetAddress._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class StreetAddress2 extends ValueObject<String> {
  factory StreetAddress2(String input) {
    return StreetAddress2._(validateStringNotEmpty(input));
  }

  const StreetAddress2._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class City extends ValueObject<String> {
  factory City(String input) {
    return City._(validateStringNotEmpty(input));
  }

  const City._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class UserState extends ValueObject<String> {
  factory UserState(String input) {
    return UserState._(validateStringNotEmpty(input));
  }

  const UserState._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Country extends ValueObject<String> {
  factory Country(String input) {
    return Country._(validateStringNotEmpty(input));
  }

  const Country._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class ZipCode extends ValueObject<String> {
  factory ZipCode(String input) {
    return ZipCode._(validateZipCode(input));
  }

  const ZipCode._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
