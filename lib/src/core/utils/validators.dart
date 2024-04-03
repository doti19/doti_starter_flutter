import 'package:doti_starter/src/core/extension/string.dart';
import 'package:flutter/material.dart';

abstract class Validators {
  Validators._();

  static FormFieldValidator<String>? getValidator(TextInputType? keyboardType) {
    return switch (keyboardType) {
      TextInputType.emailAddress => Validators.email,
      TextInputType.number => Validators.number,
      _ => null,
    };
  }

  static String? required(String? input) {
    if (input?.trim().isEmpty ?? true) {
      return 'Required';
    }

    return null;
  }

  static String? requiredTyped<T>(T? input) {
    if (input == null) {
      return 'Required';
    }

    return null;
  }

  static String? email(String? email) {
    if (email == null || email.isEmpty) {
      return 'Required';
    }

    if (!email.isValidEmail()) {
      return 'Enter valid email';
    }

    return null;
  }

  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return 'Required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (!password.contains(RegExp('[A-Z]'))) {
      return 'Password must contain at least one capital letter';
    }

    return null;
  }

  static String? number(String? input) {
    if (input == null) {
      return 'Required';
    }

    final number = num.tryParse(input);
    if (number == null) {
      return 'Enter valid number';
    }

    return null;
  }

  static String? positiveInteger(String? input) {
    if (input == null) {
      return 'Required';
    }

    final integer = int.tryParse(input);
    if (integer == null || integer <= 0) {
      return 'Enter positive integer';
    }

    return null;
  }
}

class Validator {
  const Validator();

  static bool isEmpty(String value) {
    return value.trim().isEmpty;
  }

  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }

  static bool isWeak(String value, {int length = 8}) {
    return value.length >= length;
  }

  static bool isEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static bool isEmptyFields(List<String> values) {
    bool emptyFields = false;
    for (var i = 0; i < values.length; i++) {
      if (isEmpty(values[i])) {
        emptyFields = true;
        break;
      }
    }

    return emptyFields;
  }

  static bool isEqualFields(List<String> values) {
    bool equal = true;
    final first = values[0];
    for (var i = 1; i < values.length; i++) {
      if (first != values[i]) {
        equal = false;
        break;
      }
    }

    return equal;
  }
}
