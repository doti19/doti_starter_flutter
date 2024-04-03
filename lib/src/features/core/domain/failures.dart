import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.invalidPhoneNumber({
    required T failedValue,
  }) = InvalidPhoneNumber<T>;

  const factory ValueFailure.invalidName({
    required T failedValue,
  }) = InvalidName<T>;

  const factory ValueFailure.invalidPhoneNumberCountryCode({
    required T failedValue,
  }) = InvalidPhoneNumberCountryCode<T>;

  //invalid date of birth
  const factory ValueFailure.invalidDateOfBirth({
    required T failedValue,
  }) = InvalidDateOfBirth<T>;

  const factory ValueFailure.invalidPlaceOfBirth({
    required T failedValue,
  }) = InvalidPlaceOfBirth<T>;

  const factory ValueFailure.invalidPassword({required T failedValue}) =
      InvalidPassword<T>;

  const factory ValueFailure.invalidGender({
    required T failedValue,
  }) = InvalidGender<T>;

  const factory ValueFailure.invalidRole({
    required T failedValue,
  }) = InvalidRole<T>;

  const factory ValueFailure.invalidCountry({
    required T failedValue,
  }) = InvalidCountry<T>;

  const factory ValueFailure.invalidCity({
    required T failedValue,
  }) = InvalidCity<T>;

  const factory ValueFailure.invalidZipCode({
    required T failedValue,
  }) = InvalidZipCode<T>;

  const factory ValueFailure.invalidState({
    required T failedValue,
  }) = InvalidState<T>;

  const factory ValueFailure.invalidStreetAddress({
    required T failedValue,
  }) = InvalidStreetAddress<T>;

  const factory ValueFailure.invalidStreetAddress2({
    required T failedValue,
  }) = InvalidStreetAddress2<T>;

  const factory ValueFailure.invalidOTP({
    required T failedValue,
  }) = InvalidOTP<T>;
}
