import 'package:fpdart/fpdart.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateEmail(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateOTP(String input) {
  const otpRegex = r'^[0-9]{6}$';
  if (RegExp(otpRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidOTP(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  const phoneRegex = r'''^[0-9]{10}''';
  if (RegExp(phoneRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumberCountryCode(
    String input) {
  validateStringNotEmpty(input);

  const phoneNumberCountryCodeRegex = r'^[a-zA-Z]{2}$';
  if (RegExp(phoneNumberCountryCodeRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumberCountryCode(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateName(String input) {
  validateStringNotEmpty(input);
  const nameRegex = r'''^[a-zA-Z ]+$''';
  if (RegExp(nameRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidName(failedValue: input));
  }
}

// Validate date of birth in the format of yyyy-mm-dd
Either<ValueFailure<String>, String> validateDateOfBirth(String input) {
  validateStringNotEmpty(input);
  print('helllo');
  const dateOfBirthRegex = r'^\d{4}-\d{2}-\d{2}$';
  if (RegExp(dateOfBirthRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidDateOfBirth(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePlaceOfBirth(String input) {
  validateStringNotEmpty(input);
  return right(input);
}

//invalid gender:- from the list of male, female, other
Either<ValueFailure<String>, String> validateGender(String input) {
  validateStringNotEmpty(input);

  const validGenders = ['Male', 'Female', 'Other'];
  if (validGenders.contains(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidGender(failedValue: input));
  }
}

// validate role from [player, coach, parent]
Either<ValueFailure<String>, String> validateRole(String input) {
  validateStringNotEmpty(input);

  const validRoles = ['Player', 'Coach', 'Parent'];
  if (validRoles.contains(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidRole(failedValue: input));
  }
}

// validate street Address
Either<ValueFailure<String>, String> validateStreetAddress(String input) {
  validateStringNotEmpty(input);

  const streetAddressRegex = r'^[a-zA-Z0-9 ]{3,50}$';
  if (RegExp(streetAddressRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidStreetAddress(failedValue: input));
  }
}

// validate street Address 2
Either<ValueFailure<String>, String> validateStreetAddress2(String input) {
  const streetAddress2Regex = r'^[a-zA-Z0-9 ]{3,50}$';
  if (RegExp(streetAddress2Regex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidStreetAddress2(failedValue: input));
  }
}

// validate city
Either<ValueFailure<String>, String> validateCity(String input) {
  validateStringNotEmpty(input);

  const cityRegex = r'^[a-zA-Z ]{3,50}$';
  if (RegExp(cityRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidCity(failedValue: input));
  }
}

// validate state
Either<ValueFailure<String>, String> validateState(String input) {
  validateStringNotEmpty(input);

  const stateRegex = r'^[a-zA-Z ]{3,50}$';
  if (RegExp(stateRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidState(failedValue: input));
  }
}

// validate country
Either<ValueFailure<String>, String> validateCountry(String input) {
  validateStringNotEmpty(input);

  const countryRegex = r'^[a-zA-Z ]{3,50}$';
  if (RegExp(countryRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidCountry(failedValue: input));
  }
}

// validate zip code
Either<ValueFailure<String>, String> validateZipCode(String input) {
  const zipCodeRegex = r'^[0-9]{6}$';
  if (RegExp(zipCodeRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidZipCode(failedValue: input));
  }
}
