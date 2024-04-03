// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `flutter_bloc_app_template`
  String get appTitle {
    return Intl.message(
      'flutter_bloc_app_template',
      name: 'appTitle',
      desc: 'The title of the application',
      args: [],
    );
  }

  /// `Sample Items`
  String get itemsTitle {
    return Intl.message(
      'Sample Items',
      name: 'itemsTitle',
      desc: 'The title of the sample items',
      args: [],
    );
  }

  /// `Messages`
  String get messagesTitle {
    return Intl.message(
      'Messages',
      name: 'messagesTitle',
      desc: 'The title of the messages screen',
      args: [],
    );
  }

  /// `Sample Item {id}`
  String itemTitle(Object id) {
    return Intl.message(
      'Sample Item $id',
      name: 'itemTitle',
      desc: 'The title of the item',
      args: [id],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: 'The title of the settings',
      args: [],
    );
  }

  /// `Theme`
  String get themeTitle {
    return Intl.message(
      'Theme',
      name: 'themeTitle',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get systemThemeTitle {
    return Intl.message(
      'System Theme',
      name: 'systemThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightThemeTitle {
    return Intl.message(
      'Light Theme',
      name: 'lightThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkThemeTitle {
    return Intl.message(
      'Dark Theme',
      name: 'darkThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yellow Theme`
  String get yellowThemeTitle {
    return Intl.message(
      'Yellow Theme',
      name: 'yellowThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Experimental Theme`
  String get experimentalThemeTitle {
    return Intl.message(
      'Experimental Theme',
      name: 'experimentalThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Item Details`
  String get itemDetailsTitle {
    return Intl.message(
      'Item Details',
      name: 'itemDetailsTitle',
      desc: 'The title of the Item Details screen',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Empty list`
  String get emptyList {
    return Intl.message(
      'Empty list',
      name: 'emptyList',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get tabHome {
    return Intl.message(
      'Home',
      name: 'tabHome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tabSettings {
    return Intl.message(
      'Settings',
      name: 'tabSettings',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get newsScreen {
    return Intl.message(
      'News',
      name: 'newsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Disabled`
  String get disabledButtonTitle {
    return Intl.message(
      'Disabled',
      name: 'disabledButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disabled Rounded`
  String get disabledRoundedButtonTitle {
    return Intl.message(
      'Disabled Rounded',
      name: 'disabledRoundedButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Disabled With Icon`
  String get disabledWithIconButtonTitle {
    return Intl.message(
      'Disabled With Icon',
      name: 'disabledWithIconButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get enabledButtonTitle {
    return Intl.message(
      'Enabled',
      name: 'enabledButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `BorderRadius`
  String get borderRadiusButtonTitle {
    return Intl.message(
      'BorderRadius',
      name: 'borderRadiusButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `BorderSide`
  String get borderSideButtonTitle {
    return Intl.message(
      'BorderSide',
      name: 'borderSideButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `With Icon`
  String get iconButtonTitle {
    return Intl.message(
      'With Icon',
      name: 'iconButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `With Icon Padding`
  String get iconAndPaddingButtonTitle {
    return Intl.message(
      'With Icon Padding',
      name: 'iconAndPaddingButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transparent`
  String get transparentButtonTitle {
    return Intl.message(
      'Transparent',
      name: 'transparentButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Oops, there's a problem accessing local storage.`
  String get storageError {
    return Intl.message(
      'Oops, there\'s a problem accessing local storage.',
      name: 'storageError',
      desc: '',
      args: [],
    );
  }

  /// `some error with the client, please check again`
  String get userError {
    return Intl.message(
      'some error with the client, please check again',
      name: 'userError',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Slow or no network connection. Please check your internet settings.`
  String get noConnectionError {
    return Intl.message(
      'Slow or no network connection. Please check your internet settings.',
      name: 'noConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Server error occured. Please try again later.`
  String get serverError {
    return Intl.message(
      'Server error occured. Please try again later.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Password must have minimum of 6 characters`
  String get shortPasswordVerificationText {
    return Intl.message(
      'Password must have minimum of 6 characters',
      name: 'shortPasswordVerificationText',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember Password`
  String get rememberPassword {
    return Intl.message(
      'Remember Password',
      name: 'rememberPassword',
      desc: '',
      args: [],
    );
  }

  /// `Failed getting sign in status`
  String get signInStatusError {
    return Intl.message(
      'Failed getting sign in status',
      name: 'signInStatusError',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Or Login With`
  String get orLoginWith {
    return Intl.message(
      'Or Login With',
      name: 'orLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `Please input a valid email address`
  String get validEmailVerificationText {
    return Intl.message(
      'Please input a valid email address',
      name: 'validEmailVerificationText',
      desc: '',
      args: [],
    );
  }

  /// `Thank You For Registering With Us.`
  String get thankYouForRegistering {
    return Intl.message(
      'Thank You For Registering With Us.',
      name: 'thankYouForRegistering',
      desc: '',
      args: [],
    );
  }

  /// `We've Sent you a Code, Please Enter to proceed`
  String get sentYouCode {
    return Intl.message(
      'We\'ve Sent you a Code, Please Enter to proceed',
      name: 'sentYouCode',
      desc: '',
      args: [],
    );
  }

  /// `Please input a valid OTP`
  String get validOTPText {
    return Intl.message(
      'Please input a valid OTP',
      name: 'validOTPText',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOTP {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOTP',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {userName}`
  String welcomeUser(Object userName) {
    return Intl.message(
      'Welcome $userName',
      name: 'welcomeUser',
      desc: '',
      args: [userName],
    );
  }

  /// `Please Enter a valid first Name`
  String get validFirstNameText {
    return Intl.message(
      'Please Enter a valid first Name',
      name: 'validFirstNameText',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a valid last Name`
  String get validLastNameText {
    return Intl.message(
      'Please Enter a valid last Name',
      name: 'validLastNameText',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a valid Gender Value`
  String get validGenderText {
    return Intl.message(
      'Please Enter a valid Gender Value',
      name: 'validGenderText',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a valid Role Value`
  String get validRoleText {
    return Intl.message(
      'Please Enter a valid Role Value',
      name: 'validRoleText',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a valid Phone number`
  String get validPhoneNumberText {
    return Intl.message(
      'Please Enter a valid Phone number',
      name: 'validPhoneNumberText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid Date`
  String get validBirthDateText {
    return Intl.message(
      'please Enter a valid Date',
      name: 'validBirthDateText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid place of birth`
  String get validPlaceOfBirthText {
    return Intl.message(
      'please Enter a valid place of birth',
      name: 'validPlaceOfBirthText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid Password`
  String get validPasswordText {
    return Intl.message(
      'please Enter a valid Password',
      name: 'validPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid StreetAddress`
  String get validStreetAddressText {
    return Intl.message(
      'please Enter a valid StreetAddress',
      name: 'validStreetAddressText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid StreetAddress2`
  String get validStreetAddress2Text {
    return Intl.message(
      'please Enter a valid StreetAddress2',
      name: 'validStreetAddress2Text',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid City`
  String get validCityText {
    return Intl.message(
      'please Enter a valid City',
      name: 'validCityText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid zip code`
  String get validZipCodeText {
    return Intl.message(
      'please Enter a valid zip code',
      name: 'validZipCodeText',
      desc: '',
      args: [],
    );
  }

  /// `please Enter a valid State`
  String get validStateText {
    return Intl.message(
      'please Enter a valid State',
      name: 'validStateText',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a valid Country Name`
  String get validCountryText {
    return Intl.message(
      'Please Enter a valid Country Name',
      name: 'validCountryText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
